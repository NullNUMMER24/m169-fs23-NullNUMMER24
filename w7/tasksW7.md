# Cluster und Node IP
### Cluster IP
Die Cluster IP ist eine clusterinterne IP, wodurch ein Service clusterweit verfügbar gemacht werden kann. 
_Diese Methode ist nicht **nicht** für Produktionsumgebungen geeignet._ Sie ist eher fürs Debugging gedacht. 

### Node IP
Wird ein Service als NodePort deklariert, wird die IP Adresse jedes Nodes an einen statischen Port gebunden. Dieser Port liegt im Bereich 30'000-32'767. Sobald dies eingerichtet wurde, ist das Node von ausserhalb von ausserhalb des Clusters erreichbar.  

# Loadbalancer
Wenn ein Service als LoadBalancer deklariert wurde, wird dieser extern verfügbar gemacht. Ein Cloudanbieter stellt einen Loadbalancer für den Service bereit und weist automatisch Node Ports zu. 