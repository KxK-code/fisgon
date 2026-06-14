#!/bin/bash

# Configuración automática del repositorio
# Obtiene el usuario y repositorio actual de los metadatos de Git de forma dinámica
if [ -d .git ]; then
    URL_REMOTO=$(git config --get remote.origin.url)
    USUARIO_GITHUB=$(echo "$URL_REMOTO" | sed -E 's|https://github.com([^/]+)/.*|\1|')
    REPOSITORIO=$(echo "$URL_REMOTO" | sed -E 's|https://github.com[^/]+/([^.]+).*|\1|')
else
    # Si no se clona con git, usa estos valores por defecto (CÁMBIALOS POR LOS TUYOS)
    USUARIO_GITHUB="TuUsuarioDeGithub"
    REPOSITORIO="dnsinspect"
fi

URL_PAGINAS="https://raw.githubusercontent{USUARIO_GITHUB}/${REPOSITORIO}/main/paginas.txt"
ARCHIVO_LOCAL="$HOME/paginas.txt"

# Verificar que existan las herramientas necesarias
if ! command -v dig &> /dev/null; then
    echo "Error: Requieres 'dig'. Instálalo con: pkg install dnsutils"
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "Error: Requieres 'curl' para descargar la lista. Instálalo con: pkg install curl"
    exit 1
fi

# Descarga automática si el archivo local 'paginas.txt' no existe
if [ ! -f "$ARCHIVO_LOCAL" ]; then
    echo -e "\e[1;33m[INSTALACIÓN]\e[0m No se encontró 'paginas.txt'. Descargando lista desde tu GitHub..."
    curl -s -f -o "$ARCHIVO_LOCAL" "$URL_PAGINAS"
    
    if [ $? -ne 0 ] || [ ! -s "$ARCHIVO_LOCAL" ]; then
        echo -e "\e[1;31m[ERROR]\e[0m No se pudo descargar el archivo desde GitHub."
        echo "Verifica que el repositorio sea público y que 'paginas.txt' esté en la rama main."
        rm -f "$ARCHIVO_LOCAL"
        exit 1
    fi
    echo -e "\e[1;32m[ÉXITO]\e[0m Lista de 573 páginas descargada e instalada en tu sistema.\n"
fi

if [ -z "$1" ]; then 
    echo "Uso: ./dnsinspect.sh [pagina.com o IP]"
    exit 1
fi

target_dns="$1"
if [[ ! "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then 
    echo -e "\e[1;34m[AUDITORÍA AUTOMÁTICA]\e[0m Buscando servidor de nombres para: $1"
    found=$(dig +short NS $1 | head -n 1)
    if [ -z "$found" ]; then 
        found=$(dig $1 | grep -A 1 "AUTHORITY SECTION" | tail -n 1 | awk "{print \$5}")
    fi
    if [ ! -z "$found" ]; then 
        ip_found=$(dig +short $found | head -n 1)
        if [ ! -z "$ip_found" ]; then 
            target_dns="$ip_found"
        else 
            target_dns="$found"
        fi
        echo -e "\e[1;32m[DNS ASIGNADO]:\e[0m $target_dns"
    else 
        echo -e "\e[1;31m[ERROR]\e[0m No se pudo hallar el DNS de $1. Usando $1 directamente..."
    fi
fi

echo -e "\n\e[1;35m[INICIANDO ANÁLISIS DE CACHÉ]:\e[0m Servidor -> $target_dns\n"
si_count=0
no_count=0

# Procesar el archivo local línea por línea
while IFS= read -r line || [ -n "$line" ]; do
    if [[ -z "$line" ]]; then 
        continue
    fi
    if [[ "$line" =~ ^# ]]; then
        echo -e "\n\e[1;36m==== $line ====\e[0m"
        continue
    fi
    res=$(dig @$target_dns $line +norecurse)
    if echo "$res" | grep -q "ANSWER SECTION" && ! echo "$res" | grep -q "status: SERVFAIL"; then
        echo -e "\e[1;32m[SI VISITADA]\e[0m $line"
        ((si_count++))
    else
        echo -e "\e[1;31m[NO VISITADA]\e[0m $line"
        ((no_count++))
    fi
done < "$ARCHIVO_LOCAL"

total=$(($si_count + $no_count))
echo -e "\n\e[1;33m========================================\e[0m"
echo -e "\e[1;32mPÁGINAS VISITADAS ENCONTRADAS:\e[0m $si_count"
echo -e "\e[1;31mPÁGINAS NO VISITADAS:\e[0m $no_count"
echo -e "\e[1;34mTOTAL DE SITIOS AUDITADOS:\e[0m $total"
echo -e "\e[1;33m========================================\e[0m\n"
