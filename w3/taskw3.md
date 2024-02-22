# Was ist Docker Compose
Docker Compose ist ein Tool zur Definition und Ausfürung von Docker-Anwendungen mit mehreren Containern. Der Vorteil dieses Tools ist, dass mehrere Umgebungen auf einmal gestartet werden können und die Container nach Angaben eines YAML Configfiles aufbaut. 

# Vorgehen Docker Compose App Version 2
## 1. Docker Compose installieren
sudo dnf install docker-compose

## 2. Docker Compose File anpassen
Da es bereits ein Docker-Compose File im To-Do Ordner gab, habe ich dieses etwas überarbeitet und auf das neue Frontend angepasst. In meiner Umgebung habe ich den Frontendv2 Ordner vom Git in den To-Do Ordner verschoben.
Mein Docker-Compose File: 
version: "3"
services:
  todoapp:
    build: ./web-frontendv2
    ports:
     - "3000"
    depends_on:
     - redis-master
     - redis-slave
  redis-slave:
    build: ./redis-slave
    depends_on:
     - redis-master
  redis-master:
    build: ./redis-master

## 3. Umgebung mit Docker Compose starten
Die Umgebung lässt sich ganz einfach mit dem Befehl starten:
docker-compose -f docker-compose.yml up -d 

## 4. Umgebung mit Docker Compose beenden
Und herunterfahren lässt sich das Ganze mit:
docker-compose -f docker-compose.yml down

# Portainer installieren
## Schritt1: Ein Docker Volume erstellen
docker volume create portainer_data

## Schritt2: Portainer installieren
```Bash
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:2.9.3
```
## Schritt 3: Auf Portainer Dashboard zugreiffen
Das Dashboard sollte nun über: 
https://localhost:9443 ,
erreichbar sein. 
 
# Sock-Shop via Docker Compose installieren
1. Repo herunterladen
2. sudo docker-compose -f deploy/docker-compose/docker-compose.yml up -d

