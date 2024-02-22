# Container + Usecases
_Ohne Conteiner müsste man für jede Applikation einen Server oder VM bereitstellen. Dies ist nicht sehr effizient und auch sehr schnell extrem kostspielig._ 

Es können also viel mehr Applikationen auf einmal betrieben werden, ohne wirklich bemerkbare Leistungseinbussen. 
Ein Container ist daher besser, weil er nicht alle Ressourcen für ein vollständiges System simulieren muss. 
Container lassen das OS Layer weg und benutzen direkt den Host. So muss kein Operating system kopiert/erstellt werden. Dies spart Zeit und speicher. 
### Usecases:
- Applikationen
- Betriebssysteme?
- Hosting
- Fileserver
- Websites
- Gameservers


# Was ist DevOps
_Unter DevOps versteht man diverse Praktiken, Tools und Kulturphilosophie, die Prozesse zwischen Softwareentwicklungs- und IT-Teams automatisieren und integrieren._

Um 2007 begann die DevOps-Bewegung, als Softwareentwicklung und IT Operations Bedenken über die bisherigen Softwareentwicklungsmodell äusserten.
DevOps ist eine Kombination aus den Wörtern: Development und Operations. In dem Modul 169 wird nach den DevOps Prinzipien gearbeitet.


# Unterschied Virtualisierung und Container
_Bei einer VM muss das ganze Betriebssystem zur Verfügung gestellt werden. Hingegen bei einem Container nur die Applikation virtualisiert wird._

Deshalb lohnt es sich mehr, für einzelne Applikationen, einen Container und eine VM bei Remote Systemen einzusetzen. Ein weiterer Vorteil der Container ist, dass sie sich sehr schnell starten lassen.


# Unterschied Container und Image
_Ein Container benötigt ein Image um zu starten._

Ein Image ist ein Read-Only File, welches eine Vorlage für die Erstellung von Containern enthält. 
Man kann sich ein Image also als eine Art Bauplan vorstellen. Es zu vergleichen gibt also nicht wirklich Sinn. 


# Die Wichtigsten Docker Befehle zusammengefasst
## Run a new Container
### Sart a new Container from an Image
run IMAGE
docker run nginx
### ...and assign it a name
docker run --name CONTAINER IMAGE
docker run --name web nginx
### ...and map a port
docker run -p HOSTPORT:CONTAINERPORT IMAGE
docker run -p 8080:80 nginx
### ...and map all ports
docoker run -P IMAGE
docker run -P nginx
### ...and start container in background
docker run -d IMAGE
docker run -d nginx
### ...and assign it a hostname
docker run --hostname HOSTNAME I MAGE
docker run --hostname nginx
### ...and add a dns entry
docker run -add-host HOSTNAXE:IP IMAGE
### ...and map a local directory Into the conta.n«
docker run -v HOSTDIR:TARGETDIR IMAGE
docker run -v ~/:/usr/share/nginx/html nginx
### ...but change the entrypoint
docker run -it --entrypoint EXECUTABLE IMAGE
docker run -it --entrypoint bash nginx

## Manage Containers
### Show a list of runrmng containers
docker ps
### Show a list of all containers
docker ps -a
### Delete a container
docker rm CONTAINER
docker rm web
### Delete a running container
docker rm -f CONTAINER
docker rm -f web
### Delete stopped containers
docker container prune
### Stop a running container
docker stop CONTAINER
docker stop web
### Start a stopped container
docker start CONTAINER
docker start web
### Copy a file from a container to the host
docker cp CONTAINER: SOURCE TARGET
docker cp web:/index.html index.html
### Copy a file from the host to a container
docker cp CONTAINER:SOURCE
docker cp web: /index.html index.html
### Start a Shell inside a runmng container
docker exec -it CONTAINER EXECUTABLE
docker exec -it web bash
### Rename a container
docker renane OLD_NAXE NEW_NAXE
docker rename 096 web
### Create an image out of container
docker commit CONTAINER
docker commit web

## Manage Images
### Download an Image
docker pull IMAGE [:TAG]
docker pull nginx
### Upload an image to a repository
docker push IMAGE
docker push myimage:1.0
### Delete an Image
docker rmi IMAGE
### Show a list of all Images
docker images
### Delete dangling images
docker image prune
### Delete all unused Images
docker image prune -a
### Bulld an Image from a Dockerfile
docker build DIRECTORY
docker build .
### Tag an image
docker tag IMAGE NEWIMAGE
docker tag ubuntu ubuntu:18.04
### Build and tag an Image from a Dockerflle
docker build -t IMAGE DIRECTORY
docker build -t myimage .
### Save an Image to -tar file
docker save IMAGE > FILE
docker save nginx > nginx.tar
### Load an Image from a .tar file
docker Ioad -i TARFILE
docker Ioad -i nginx.tar

## Info und Stats
### Show the logs of a container
docker logs CONTAINER
docker logs web
### Show stats of running containers
docker stats
### Show processes of container
docker top CONTAINER
docker top web
### Show installed docker version
docker version
### Get detailed Info about an Object
docker inspect NAME
docker Inspect nginx
### Show all modified files In container
docker diff CONTAINER
docker diff web
### Show mapped ports of a container
docker port CONTAINER
docker port web
