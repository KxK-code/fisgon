# DNSInspect

DNSInspect es una herramienta ligera y automatizada en Bash diseñada para realizar auditorías de red pasivas mediante la técnica de **DNS Cache Snooping** (Reconocimiento por Espionaje de Caché DNS). 

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

# En Debian / Ubuntu
sudo apt install dnsutils git
```

## Guía de Instalación y Uso

Para descargar y ejecutar esta herramienta en tu terminal, utiliza los siguientes comandos:

```bash
# 1. Clonar el repositorio (Reemplaza con tu usuario real)
git clone https://github.com

# 2. Entrar a la carpeta
cd dnsinspect

# 3. Dar permisos de ejecución al script
chmod +x dnsinspect.sh

# 4. Lanzar la auditoría apuntando a un dominio o IP
./dnsinspect.sh senado.gob.mx
```

## Estructura del Diccionario de Páginas Incluido (573 Sitios)

El script procesa de forma nativa los siguientes objetivos estructurados mediante etiquetas de comentarios:

```text
# BUSCADORES Y UTILIDADES
google.com, yahoo.com, google.com.mx, live.com, ://live.com, microsoft.com, wikipedia.org, chatgpt.com, office.com, zoom.us, ://microsoft.com, github.com, gitlab.com, bitbucket.org, stackoverflow.com, bitly.com, speedtest.net, canva.com, adobe.com, github.io, sourceforge.net, w3schools.com, geekforgeeks.org, medium.com, dev.to, quora.com, answers.com, ask.com, duckduckgo.com, ecosia.org, bing.com, wolframalpha.com, weather.com, accuweather.com, wunderground.com, meteored.mx, archive.org, pastebin.com, cyberchef.io, docker.com, kubernetes.io, ://amazon.com, ://google.com, ://microsoft.com, digitalocean.com, linode.com, vultr.com, ovhcloud.com, hostgator.com, bluehost.com, godaddy.com, namecheap.com, cloudflare.com, fastly.com, akamai.com

# REDES SOCIALES Y FOROS
facebook.com, instagram.com, whatsapp.com, x.com, tiktok.com, reddit.com, pinterest.com, linkedin.com, discord.com, twitch.tv, kick.com, twitch.com, patreon.com, proboards.com, forocoches.com, 4chan.org, 8ch.net, ://reddit.com

# BANCARIAS Y FINANZAS
bbva.mx, banamex.com, santander.com.mx, banorte.com, hsbc.com.mx, bnamericas.com, binance.com, coinbase.com, coingecko.com, coinmarketcap.com, tradingview.com, blockchain.com, kraken.com, kucoin.com, etherscan.io, solscan.io, bancodevenezuela.com, bcv.org.ve, bna.com.ar, bancochile.cl, bancoestado.cl, bancolombia.com, davivienda.com, bcp.com.pe, interbank.pe, bbva.pe

# MULTIMEDIA Y STREAMING
youtube.com, netflix.com, spotify.com, disneyplus.com, max.com, primevideo.com, vix.com, plutotv.tv, tubitv.com, vimeo.com, dailymotion.com, soundcloud.com, deezer.com, apple.com, tidal.com, tunein.com, claromusica.com, ://google.com, hulu.com, hbomax.com, paramountplus.com, peacocktv.com, crunchyroll.es, vudu.com, plex.tv, rtve.es, atresplayer.com, mitele.es, clarovideo.com, izgoplay.mx, directvgo.com

# ENTREVISTAS Y CITAS
tinder.com, badoo.com, okcupid.com, bumble.com, grindr.com, happn.com, badongo.com, imworld.com, ts-dating.com, transdr.com, ts-contacts.com, skipthegames.com, listcrawler.app, eros.com, slixa.com, eurogirlescort.com, planetescort.com, mileroticos.com, pasion.com, adultsearch.com, escortdirectory.com, cityvibe.com, vivastreet.co.uk, squirt.org, recon.com, scruff.com, hornet.com, sniffies.com, planetromeo.com, manhunt.net, adam4adam.com, gaydar.net, ashleymadison.com, match.com, lovoo.com, pof.com, innercircle.co, meetic.es, ourtime.com, zoosk.com, hinge.co, adultfriendfinder.com, cams.com, imlive.com, flirt.com

# ENTRETENIMIENTO PARA ADULTOS
xnxx.com, pornhub.com, xvideos.com, xhamster.com, stripchat.com, chaturbate.com, camsoda.com, livejasmin.com, bongacams.com, onlyfans.com, justforfans.com, fansly.com, dmm.co.jp, fc2.com, gaymaletube.com, gaytube.com, men.com, seanody.com, nextdoorstudios.com, machotube.tv, boynami.com, helixstudios.com, queerclick.com, xtube.com, gaypornhd.com, chaosmen.com, corbinfisher.com, badpuppy.com, shemaletube.com, tgxtube.com, tsfucker.com, grooby.com, shemalecanada.com, shemalewiki.com, trannytube.tv, tserotica.com, shemalepornstars.com, youporn.com, redtube.com, spankbang.com, eporner.com, porntrex.com, hqporner.com, txxx.com, vporn.com

# GUBERNAMENTALES Y TRÁMITES
sat.gob.mx, ine.mx, gob.mx, curp.gob.mx, imss.gob.mx, issste.gob.mx, infonavit.org.mx, cfe.mx, customs.gob.mx, sre.gob.mx, se.gob.mx, shcp.gob.mx, banxico.org.mx, cnbv.gob.mx, condusef.gob.mx, profeco.gob.mx, sectur.gob.mx, sct.gob.mx, semarnat.gob.mx, sagarpa.gob.mx, salud.gob.mx, sedena.gob.mx, semar.gob.mx, segob.gob.mx, pgr.gob.mx, scjn.gob.mx, diputados.gob.mx, senado.gob.mx, te.gob.mx, cjf.gob.mx, afip.gob.ar, anses.gob.ar, sii.cl, dian.gov.co, sunat.gob.pe, patria.org.ve

# COMERCIO ELECTRÓNICO Y COMPRAS
mercadolibre.com.mx, coppel.com, liverpool.com.mx, sears.com.mx, palaciodehierro.com, homedepot.com.mx, walmart.com.mx, amazon.com.mx, aliexpress.com, temu.com, shein.com, shopee.com.mx, ebay.com, bestbuy.com, shein.com.mx, costco.com.mx, sams.com.mx, soriana.com, chedraui.com.mx, lacomer.com.mx, hebe.com, oxxo.com, 7-eleven.com.mx, mercadolibre.com, mercadolivre.com.br, olx.com.br, mercadolibre.com.ve, mercadolibre.com.ar, mercadolibre.cl, mercadolibre.com.co, mercadolibre.com.pe

# VIDEOJUEGOS
roblox.com, steamcommunity.com, steampowered.com, epicgames.com, playstation.com, xbox.com, nintendo.com, chess.com, macrojuegos.com, cartoonnetwork.com.mx, disneylatino.com, unidos.com.mx, heftychili.com, steamdb.info, nexusmods.com, moddb.com, curseforge.com, itch.io, gog.com, humblebundle.com, greenmangaming.com, fanatical.com, g2a.com, kinguin.net, eneba.com, instant-gaming.com, cdkeys.com

# DEPORTES
marca.com, mediotiempo.com, as.com, espn.com.mx, foxsports.com.mx, record.com.mx, skysports.com, dazn.com, ufc.com, wwe.com, nba.com, nfl.com, mlb.com, fifa.com, f1.com, motogp.com, olympics.com

# NOTICIAS Y MEDIOS
eluniversal.com.mx, milenio.com, proceso.com.mx, reforma.com, jornada.com.mx, aristeguinoticias.com, animalpolitico.com, uno-tv.com, unotv.com, televisa.com, tvazteca.com, nmas.com.mx, sipse.com, sopitas.com, sdpnoticias.com, elfinanciero.com.mx, eleconomista.com.mx, forbes.com.mx, expansion.mx, culinary.net, allrecipes.com, kiwilimon.com, infobae.com, lanacion.com.ar, clarin.com, emol.com, latercera.com, eltiempo.com, elespectador.com, elcomercio.pe, larepublica.pe

# ENTRETENIMIENTO Y CINE
ticketmaster.com.mx, superboletos.com, cinepolis.com, cinemex.com, fandom.com, imdb.com, rottentomatoes.com, filmaffinity.com, crunchyroll.com

# IMÁGENES Y DISEÑO
fremont.com, imgur.com, giphy.com, tenor.com, flickr.com, deviantart.com, behance.net, dribbble.com, artstation.com, unsplash.com, pexels.com, pixabay.com, shutterstock.com, gettyimages.com, adobe-stock.com, istockphoto.com, depositphotos.com, freepik.com, flaticon.com, fontspace.com, dafont.com, ://google.com, myfonts.com, 1001freefonts.com

# EDUCACIÓN Y CIENCIA
academia.edu, researchgate.net, sciencedirect.com, springer.com, wiley.com, nih.gov, scielo.org, redalyc.org, unam.mx, ipn.mx, uam.mx, itesm.mx, ibero.mx, itam.mx, anahuac.mx, lasalle.mx, uv.mx, uanl.mx, udg.mx, uaslp.mx, buap.mx, uaemex.mx, uaq.mx, uabc.mx, uson.mx, uady.mx, ujat.mx, uaeh.edu.mx, uaem.mx, uadec.mx, uach.mx, ujed.mx, uas.edu.mx, uabc.edu.mx, uaa.mx, colmex.mx, cinvestav.mx, cide.edu, conacyt.mx

# PELÍCULAS EN LÍNEA Y TORRENTS
cuevana.pro, cuevana4.me, pelisplus.to, pelisplus.so, seriespapaya.to, pelispediacool.com, hdtoday.tv, fmovies.to, bflix.to, eztv.re, limetorrents.to, torrentgalaxy.to, kickasstorrents.to, nyaa.si, fitgirl-repacks.site, skidrowreloaded.com, megadn.org, compucalitv.com, intercambiosvirtuales.org, identi.io, gnula.nu, repelis.net, thepiratebay.org, 1337x.to, rutracker.org

# ALMACENAMIENTO Y TRANSFERENCIA
mega.nz, mediafire.com, ://google.com, dropbox.com, wetransfer.com, rapidgator.net, turbobit.net, 4shared.com, scribd.com, issuu.com, slideshare.net

# TURISMO Y TRANSPORTE
booking.com, airbnb.mx, trivago.com.mx, despegar.com.mx, expedia.mx, aeromexico.com, vivaaerobus.com, volaris.com, uber.com, didi-global.com, cabify.com, tripadvisor.com.mx, skyscanner.mx, kayak.com.mx, blablacar.mx, etn.com.mx, primeraplus.com.mx, ado.com.mx, futura.com.mx

# SITIOS INTERNACIONALES VARIADOS
aliexpress.ru, taobao.com, jd.com, tmall.com, baidu.com, qq.com, weibo.com, bilibili.com, sohu.com, sina.com.cn, yandex.ru, vk.com, ok.ru, mail.ru, rambler.ru, habr.com, pixiv.net, nicovideo.jp, yahoo.co.jp, amazon.co.jp, rakuten.co.jp, naver.com, daum.net, coupang.com, tistory.com, globo.com, uol.com.br

# SECCIÓN DE CONTROL TRAMPA
paginamexicanaquenoexisteabsolutamenteenningunlado.com
```

## Descargo de Responsabilidad
Este software ha sido desarrollado estrictamente con fines educativos, de investigación y para la ejecución de pruebas de penetración autorizadas. El uso de esta herramienta contra infraestructuras sin el consentimiento previo y explícito de sus administradores es responsabilidad exclusiva del usuario final."recuerda la responsabilidad es de quien conduce el auto no de quien lo fabrica.metafora"
