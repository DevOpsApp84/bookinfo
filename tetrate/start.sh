#!/bin/bash
kubectx k3d-poc-istio-tetrate
nohup kubectl port-forward svc/istio-ingressgateway --address 0.0.0.0 8080:80 -n istio-system &
nohup kubectl port-forward svc/istio-ingressgateway --address 0.0.0.0 8443:443 -n istio-system &
nohup kubectl port-forward svc/kiali --address 0.0.0.0 20001:20001 -n istio-system &
nohup kubectl port-forward svc/prometheus --address 0.0.0.0 9090:9090 -n istio-system &
nohup kubectl port-forward svc/grafana --address 0.0.0.0 3000:3000 -n istio-system &
nohup kubectl port-forward svc/zipkin --address 0.0.0.0 9411:9411 -n istio-system &
nohup kubectl port-forward svc/tracing --address 0.0.0.0 8088:80 -n istio-system &
