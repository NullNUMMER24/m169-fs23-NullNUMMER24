# Sock Shop installieren
1. Dashboard installieren
```Bash
microk8s enable dashboard dns ingress
```
2. Dashboard starten
```Bash
dashboard-proxy
```
3. Apply kubectl 
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/complete-demo.yaml
```
4. Hostfile anpassen
```Bash
nvim /etc/hosts
```
5. Ingres
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/complete-demo.yaml
```
6. Auf http://sock-shop.ch verbinden

# Kiali installieren
_Als erstes muss bei microk8s das community repo aktiviert werden._
```Bash
microk8s enable community
```
1. istio aktivieren
```Bash
sudo microk8s enable isitio
```
2. metalb aktivieren
```Bash
microk8s enable metallb
192.168.1.200-192.168.1.250
```
3. istio gateway
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/sockshop-istio-gateway.yaml%60
```
4. kubectl grafana
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/grafana.yaml
```
5. prometheus
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/prometheus.yaml
```
6. kiali
```Bash
microk8s kubectl apply -f https://gitlab.com/thomas-staub/cloudmodules/m169/demobeispiele/sock-shop/-/raw/main/deploy/kubernetes/kiali.yaml
```
7. Port forward
```Bash
microk8s kubectl port-forward -nistio-system svc/kiali 20001
```
# Monitoring Prometheus und Grafana
1. **Prometheus** forwarden
```Bash
microk8s kubectl port-forward -nistio-system svc/prometheus 9090
localhost:9090 (im browser)
```
2. **Grafana** forwarden
```Bash
microk8s kubectl port-forward -nistio-system svc/grafana 3000
localhost:3000 (Im browser)
```
3. **Grafana** add datasource
- Configuration
- ---> Data Sources 
- ---> Add Data source
- ---> URL("prometheus":port)
- ---> Safe & Test
4. Dashboard hinzufügen
- dashboard
- import
- 1860
- load
- save

