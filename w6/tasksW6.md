# Was ist der Raft-Konsens-Algorithmus
Der Raft-Konsensalgorithmus ist ein Computeralgorithmus, der eine Zustandsmaschine auf einen Cluster von Computersystemen verteilt. Es stellt sicher, dass jeder Knoten im Cluster auch bei Fehlern dieselbe Reihe von Zustandsübergängen vereinbart.
# Weshalb wird eine ungerade Anzahl an Servern empfohlen
Fällt ein Knoten bei der Transaktion von Daten aus, beispielsweise aufgrund von Netzwerkproblemen oder einem defekten System, bilden die beiden anderen Knoten weiterhin die erforderliche Mehrheit, um die Transaktion dennoch erfolgreich durchführen zu können.
# Wie läuft eine App in Kubernetes
Kubernetes steckt Container in sogenante Pods. Bei Anfragen werden diese automatisch auf die laufenden Instanzen der Pods verteilt. 
# Eigene App + Kubernetes
### Cluster aufsetzten
Möchte man nun selber eine App mit Kubernetes zum laufen bringen, so sollte man als erstes **microk8s** starten. 
```
microk8s start
```
Nun kann man sich vergewissern, dass alle nötigen Addons installiert sind
```
microk8s enable dashboard dns registry ingress
``
Möchte man jetzt prüfen, ob das Cluster erfolgreich gestartet wurde, so kann man dies so:
```
microk8s kubectl get nodes
```
### Replication-Controller starten
Sobald das Cluster einsatzbereit ist, kann man den Replicaiton-Controller mithilfe eines .yaml files starten. Beim Beispiel der To-Do App würde man diesen Befehl verwenden:
```
microk8s kubectl create -f .\redis-master-controller.yaml
```
Sobald das Docker Image heruntergeladen wurde kann man überprüfen, ob dieser auch gestartet wurde.
```
microk8s kubectl get pods
```
Nun kann der Redis-Master Service gestartet werden
```
microk8s kubectl create -f redis-master-service.yaml
```
Jetzt sollte man überprüfen, ob der Service erstellt wurde
```
microk8s kubectl get service
```
### Redis Slave
Redis Slave mit Controller starten
```
microk8s kubectl create -f redis-slave-controller.yaml
```
Der Replication Controller erstellt zwei Redis Slave Pods
```
microk8s kubectl get rc
```
Service starten
```
microk8s kubectl create -f redis-slave-service.yaml
```
### ToDO App starten
Nun kann noch der ToDo Pod gestartet werden
```
microk8s kubectl create -f todo-app-deploy.yaml
```
```
microk8s kubectl get deployments
```
Sobald die Pods gestartet sind sollte auch hier wieder die Services eingerichtet werden
```
microk8s kubectl create -f todo-app-service-deploy.yaml
```

# Self Healing, Scale Down, Scale Up
### Self Healing
Sobald ein Pod gelöscht wird, wird direkt ein neuer Pod generiert. 
Dies funktioniert dank dem Deployment Controller. Der Deployment Controller funktioniert änlich wie Puppet. Es wird ein Soll-Zustand angegeben. Sobald der Ist-Zustand nicht mehr dem Soll-Zustand enspricht, wird ein Vorgang in bewegung gesetzt, welcher den Ist- wieder zum Soll-Zustand ändert. Diesen Vorgang nennt man auch reconciliation.

### Scale Down
Es ist möglich, die Anzahl Pods zu reduzieren. Die Anzahl Replikationen eines Pods kann mit diesem Befehl geregelt werden:
```
microk8s kubectl scale --replicas=1 rc redis-slave
```
### Scale Up
Möchte man aber nun mehr Pods, da man mehr Leistung für die App benötigt. So kann man mit diesem Befehl die Anzahl Replikationen erhöhen:
```
microk8s kubectl scale --replicas=5 rc redis-slave
```

# Blue Green Deployment
Mit dem Blue Green Deployment Modell ist es möglich beispielsweise eine App zu updaten, auch wenn gerade viele User online sind. 
Dies geht, da die Applikation (Blau) auf einen neuen Container (Grün) geklont wurde. Auf dem Grünen Container werden dann die neuen Updates angewandt. Laufen alle Updates wie sie sollten, so wird zuerst noch ein stress Test durchgeführt. Läuft dieser ohne Probleme durch, so wird der Loadbalancer umkonfiguriert. Ein Loadbalancer leitet die Clients an ein entsprechendes Backend weiter, während der Update vorbereitung sind dies die Blauen Container. Lief alles ohne Probleme, so wird der Loadbalancer nicht mehr auf die Blauen sondern Grünen Containern weiterleiten. Somit ist ein nahtloser übergang zwischen den Updates möglich. 
Der Blaue Container kann dann als Backup oder später auch als neuer Grüner Container verwendet werden. 



