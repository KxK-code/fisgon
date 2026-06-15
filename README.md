# FISGON (DNSInspect)
Alguna vez  te dio curosidad de saber que paginas uasan en por ejemplo el senado camara de diputados pues esta es una pequeña herramienta que te dira eso no es perfecta ni hackea nada pero en general funciona muy bien con la mayoria de paginas 

Explicacion. aveces las pagina como cenado.mi.pais.com usan su dns en el mismo servidor donde comparten la red del lugar es hay cuando ase una pequeña comprobacion que no hackea nada solo le dice a su dns disculpa tines guardada estas paginas en tu cache por que alguien la pidio toma encuenta que no te dice quien ni que iso solo si la pagina la an usado y tambien igual si algun trabajador que estuviera conectado ala red pudo usarlas pero pues no todas entoces hablamos de que si en una dependencia de tu ciudad pais estan pidiendo paginas como de casinos o xxx quiere decir que no tods estan trabajando.

FISGON DNSInspect es una herramienta ligera y automatizada en Bash diseñada para realizar auditorías de red pasivas mediante la técnica de **DNS Cache Snooping** (Reconocimiento por Espionaje de Caché DNS). 

La herramienta permite determinar si un servidor DNS específico tiene almacenados registros de resolución recientes para una lista predefinida de dominios, agrupando los resultados de forma clara por categorías de uso.

## Características principales

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



## Estructura del Diccionario de Páginas Incluido (573 Sitios)

El script procesa de forma nativa los siguientes objetivos estructurados mediante etiquetas de comentarios:

```text
# BUSCADORES Y UTILIDADES
google.com
yahoo.com
google.com.mx

#REDES SOCIALES
whatsapp.com
x.com
tiktok.com
reddit.com

#STREAMING
youtube.com
netflix.com
spotify.com
disneyplus.com
max.com

# CONTENIDO ADULTOS
xnxx.com
pornhub.com
xvideos.com
xhamster.com

# SECCIÓN DE CONTROL TRAMPA
paginamexicanaquenoexisteabsolutamenteenningunlado.com (SOLO PARA VER SI ESTA FUNCIONADO NO EXISTE ASI QUE NUNCA DEVERIA PONERLA EN VERDE)
...............
```

## Descargo de Responsabilidad
Este software ha sido desarrollado estrictamente con fines educativos, de investigación y para la ejecución de pruebas de penetración autorizadas. El uso de esta herramienta contra infraestructuras sin el consentimiento previo y explícito de sus administradores es responsabilidad exclusiva del usuario final."recuerda la responsabilidad es de quien conduce el auto no de quien lo fabrica.metafora"
