<p align="center">
  <img src="img/banner_fisgon.png" alt="FISGON DNSInspect Banner" width="100%">
</p>

# 👁️ FISGON (DNSInspect)

FISGON es una herramienta ligera y automatizada en Bash diseñada para realizar auditorías de red pasivas mediante la técnica de **DNS Cache Snooping** (Reconocimiento por Espionaje de Caché DNS). 

¿Alguna vez te ha dado curiosidad saber qué páginas web se visitan en las redes de dependencias públicas, como el Senado o la Cámara de Diputados o Alguna institución publica empresa etc. etc.? Esta herramienta te permite descubrirlo de forma automatizada.

---

### ❓ ¿Cómo funciona? (Explicación sencilla)

Muchas instituciones y organizaciones configuran sus servidores DNS en la misma red local que usan sus empleados. FISGON aprovecha esto realizando una comprobación completamente pasiva:

1. **La consulta:** El script le pregunta directamente al DNS de la institución: *"Disculpa, ¿tienes guardada esta página en tu memoria caché porque alguien la solicitó recientemente?"*.
2. **El resultado:** Si el servidor la tiene guardada, significa que **alguien dentro de esa red la visitó**.

**Nota importante:** Esto **NO es un hackeo** ni vulnera la red de nadie. La herramienta no te dirá qué persona específica entró, ni qué hizo dentro de la página; únicamente revela si el sitio ha sido utilizado. Si en una auditoría a una dependencia de gobierno saltan consultas recientes a casinos o sitios para adultos... bueno, significa que no todos ahí están trabajando. 😉

---

### 🛠️ Características Principales

* **Reconocimiento Pasivo**: No interactúa directamente con los dominios auditados; realiza consultas no recursivas (`+norecurse`) al servidor objetivo para preservar el anonimato.
* **Resolución Inteligente**: Acepta tanto direcciones IP como nombres de dominio. Si se introduce un dominio, el script localiza automáticamente su servidor de nombres de zona.
* **Resultados Categorizados**: Clasifica los dominios en secciones visuales (Bancarios, Redes Sociales, Streaming, Trámites, Entretenimiento, etc.) para facilitar el análisis.
* **Estadísticas Finales**: Al concluir el escaneo, despliega un cuadro con el recuento exacto de solicitudes encontradas, no encontradas y el total auditado.

## Requisitos del sistema

Para ejecutar este script en entornos basados en Linux (como Termux, Debian o Ubuntu), se requiere tener instalada la utilidad de consultas DNS `dig`:

```bash
# En Termux
pkg install dnsutils git
```
```bash
# En Debian / Ubuntu
sudo apt install dnsutils git
```

## Guía de Instalación y Uso

Para descargar y ejecutar esta herramienta en tu terminal, utiliza los siguientes comandos:
1.INSTALACION RECURSOS
```bash
pkg install dnsutils curl git -y
```
2.INSTALACION HERRAMIENTA
```bash
git clone https://github.com/code-KxK/fisgon
```
3.ACCEDER ALA CARPETA DE LA HERRAMIENTA DESCARGADA
```bash
cd fisgon
```
4.DAR PERMISOS AL SH DE LA HERRAMIENTA
```bash
chmod +x dnsinspect.sh
```
CODIGO TODO EN UNO
```bash
pkg install dnsutils curl git -y && git clone https://github.com/code-KxK/fisgon && cd fisgon && chmod +x dnsinspect.sh
```
DESISTALACION
```bash
rm -rf ~/fisgon
```
## 🚀 Instalación y Uso de Comando Global

Para poder ejecutar `fisgon` desde cualquier ubicación de tu terminal sin importar en qué carpeta estés parado, esto creara un comando corto para ejecutar facilmente la herramienta por ejemplo " fisgon senado.ejemplo.com "
sigue estos sencillos pasos:

### 1. Clonar el repositorio e instalar con comando corto
```bash
git clone https://github.com/code-KxK/fisgon.git
cd fisgon
chmod +x install.sh
./install.sh
```

## Estructura del Diccionario de Páginas Incluido (573 Sitios) este se descarga automaticamente puedes editarlo a tu gusto agregar o quitar las paginas que gustes dentro de la carpeta fisgon usa nano siguiendo los siguientes pasos.

Abre carpeta dela instalación 
```bash
cd fisgon
```
abre el archivo con nano
```bash
nano paginas.txt
```
Al terminar de editar solo preciona CTRL + O  para guardar luego "ENTER" para aceptar, despues CTRL + X para cerrar el editor


El script procesa de forma nativa los siguientes objetivos estructurados mediante etiquetas de comentarios:

```text
# BUSCADORES Y UTILIDADES
google.com
yahoo.com
google.com.mx
...

#REDES SOCIALES
whatsapp.com
x.com
tiktok.com
reddit.com
...

#STREAMING
youtube.com
netflix.com
spotify.com
disneyplus.com
max.com
...
# CONTENIDO ADULTOS
xnxx.com
pornhub.com
xvideos.com
xhamster.com
...

# SECCIÓN DE PRUEBA (SOLO PARA VER SI ESTA FUNCIONADO NO EXISTE ASI QUE NUNCA DEVERIA PONERLA EN VERDE)
paginamexicanaquenoexisteabsolutamenteenningunlado.com 
...............
```


## ⚠️ Descargo de Responsabilidad (Disclaimer)

**IMPORTANTE:** Este software ("FISGON") ha sido desarrollado única y exclusivamente con fines educativos, de aprendizaje técnico, investigación de seguridad y auditorías autorizadas (Ethical Hacking / OSINT). 

Al descargar, clonar, instalar o utilizar este repositorio, aceptas de forma expresa los siguientes términos:

1. **Uso Bajo Propia Responsabilidad:** El uso de esta herramienta es responsabilidad absoluta y exclusiva del usuario final. El desarrollador no se hace responsable por ninguna acción ilegal, daños, interrupciones de servicio, pérdidas de datos o consecuencias derivadas del uso de este software.
2. **Autorización Requerida:** Es responsabilidad del usuario asegurarse de que cuenta con el permiso explícito y por escrito de los administradores o propietarios de los sistemas e infraestructuras DNS antes de realizar cualquier tipo de análisis o auditoría con esta herramienta.
3. **Cumplimiento Legal:** El usuario se compromete a respetar todas las leyes locales, nacionales e internacionales aplicables en materia de seguridad informática, privacidad y delitos cibernéticos en su jurisdicción.
4. **Sin Garantías:** Este software se proporciona "tal cual" (AS IS), sin garantías de ningún tipo, explícitas o implícitas, sobre su funcionamiento, precisión o idoneidad para un propósito específico.

El creador de este proyecto **NO promueve, NO apoya y NO se solidariza** con actividades de piratería informática, espionaje corporativo ni ataques informáticos de ninguna índole. Si tu intención es utilizar esta herramienta con fines maliciosos, destructivos o no autorizados, por favor abandona este repositorio inmediatamente.

