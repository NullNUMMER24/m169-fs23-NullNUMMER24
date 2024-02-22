# Was ist Kubernetes
Kubernetes ist ein, von Google entwickeltes, Orchestrierungstool für Container. Mit Kubernetes werden sogenante Kubernetes-Netzwerke aufgebaut. Diese Kubernetes-Netzwerke bestehen aus mehreren verschiedenen Nodes. Nodes sind entweder physische Computer oder virtuelle Maschienen. 

# Was sind Microservices
Früher wurden die Anwendungen monolithisch entwickelt. Das heisst, dass alle Funktionen einer Anwendung in einer grossen, hässlichen App gebündelt werden. Dies kann zu Fehlern führen, wenn einige Dinge z.b. am Web Fronted geändert werden. Also hat man begonnen Microservice Anwendungen zu schreiben. Microservice Anwendungen teilen sich nach ihren Funktionen auf, so hat man zum Beispiel: Web Frontend, Authentifizierung, Protokollierung und Datenspeicher und bildet somit eine Mini Anwendung/Mini Service für jede Funktion. Daher der Begriff Microservice.

# Vergleich der lightweight Kubernetes Anwendungen
minikube:
	_Features_:
        	- Loadbalancer fähig
        	- Multi-Cluster
        	- NodePorts
   		- Dashboard
        	- NVIDIA GPU support

microk8s:
	_Features_:
		- Open-Source
		- minimal Kubernetes
		- lightweight development tool
		- Von Canonical --> wie Ubuntu

kubeadm:
	_Features_:
		- Möglichkeit Kubernetes Cluster auf zu setzten
		- Automatisiert das Aufsetzten von Clustern

k3s:
	_Features_:
		- Optimiert für ARM
		- Perfekt für Edge
		- Für IoT geeignet

# microk8s installieren
Für Fedora habe ich nur die Möglichkeit gefunden, microk8s via Snap Store zu installieren.
Dies kann man wie folt machen:
1. Snap installieren
```
sudo dnf install snapd
```
2. Snap Support aktivieren
```
sudo ln -s /var/lib/snapd/snap /snap
```
3. microk8s installieren
```
sudo snap install microk8s --classic
```
4. .kube Ordner im $home erstellen
```
mkdir .kube
```
5. Benötigte Config files erstellen
```
microk8s config > config
```
6. Berechtigungen anpassen
```
sudo usermod -a -G microk8s
```
7. Besitzer des .kube Ordners ändern
```
sudo chown -f -R jamie ~/.kube
```
8. System neustarten
```
sudo reboot
```
