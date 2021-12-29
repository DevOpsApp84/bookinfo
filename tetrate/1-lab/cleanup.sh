#!/bin/bash

kubectl delete -f gateway-hello-world.yaml -f vs-hello-world.yaml -f hello-world.yaml -f ns.yaml
