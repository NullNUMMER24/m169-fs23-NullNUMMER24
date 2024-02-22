# Eigenes Projekt mit K8s
Ich werde für mein Projekt diesen Code Verwenden: https://github.com/NullNUMMER24/hestia. 
### Projekt Hestia
Das Projekt Hestia ist ein kleines Projekt, welches ich gestartet habe, um mich etwas mehr mit Docker, Postgres und Node.js auseinander zu setzten. Momentan befindet sich mein Projekt noch in der entwicklung, weshalb es noch einige Fehler enhält.
Es gibt einen Backend sowie einen Frontend Container, welche die Hauptkomponente meines Projektes sind.
### Deployment File starten
Das file **deployment.yaml** lässt sich so starten:
```
sudo microk8s.kubectl apply -f deployment.yaml
```
### Hestia Service erstellen
Der Hestia Service kann so erstellt werden:
```
sudo microk8s.kubectl apply -f backend-service.yaml
```
# Images auf Dockerhub pushen
### Docker login
Als erstes musste ich mich anmelden. Dies habe ich mit 
```
sudo docker login
```
gemacht. Danach konnte ich meinen Usernamen und mein Passwort angeben. 
### Meine Repos
Das Repo für mein Frontend ist hier: https://hub.docker.com/repository/docker/nullnummer24/hestia-frontend/general.
Das für mein Backend ist das: https://hub.docker.com/repository/docker/nullnummer24/hestia-backend/general.

# Deployment
Für das Deployment habe ich eine **Deployment.yaml** Datei angelegt. 
### Mein Deployment
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hestia-deployment
spec:
  selector:
    matchLabels:
      app: my-app
  replicas: 1
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: hestia-frontend
        image: nullnummer24/hestia-frontend:V1
        ports:
        - containerPort: 3000
      - name: hestia-backend
        image: nullnummer24/hestia-frontend:V1
        env:
        - name: POSTGRES_USER
          value: postgres
        - name: POSTGRES_PASSWORD
          value: "123" 
        - name: POSTGRES_DB
          value: hestia 
        ports:
        - containerPort: 5432
```
Hier habe ich bei **image** meine Dockerimages angegeben, welche ich auf Dockerhub gepusht habe. 
# Service
Damit ich auf meine Webseite verbinden kann habe ich noch den **hestia-service** erstellt.
## Hestia Service
```
apiVersion: v1
kind: Service
metadata:
  name: hestia-service
spec:
  selector:
    app: my-app
  ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: 3000
  type: NodePort
```

