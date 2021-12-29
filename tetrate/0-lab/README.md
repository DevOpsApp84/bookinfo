### Istio installation

#### Download Istio
```
cd ~/
curl -L https://istio.io/downloadIstio | sh -
cat <<EOF >> ~/.bash_profile
export PATH="$PATH:/<YOUR ISTIO LOCATION>/istio-1.12.1/bin"
EOF
```

#### Check istioctl version
```
istioctl version
```

#### Display profiles
```
istioctl profile list
```

#### Init Operator
```
istioctl operator init
```

#### Generate Istio profile manifest
```
cat <<EOF > demo-profile.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: demo-installation
spec:
  profile: demo
EOF
```


#### Apply demo profile
```
kubectl apply -f demo-profile.yaml
```

#### Enable sidecar injection
```
kubectl label namespace <namespace> istio-injection=enabled
```


#### Update operator
```
cat <<EOF > iop-egress.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: demo-installation
spec:
  profile: demo
  components:
    egressGateways:
    - name: istio-egressgateway
      enabled: false
EOF
```

#### Separate profile operator
```
cat <<EOF > iop-internal-gateway.yaml
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  name: internal-gateway-only
  namespace: istio-system
spec:
  profile: empty
  components:
    ingressGateways:
      - namespace: some-namespace
        name: ilb-gateway
        enabled: true
        label:
          istio: ilb-gateway
        k8s:
          serviceAnnotations:
            networking.gke.io/load-balancer-type: "Internal"
EOF
```
