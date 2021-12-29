#!/bin/bash

kubectl delete -f customers.yaml -f gateway.yaml -f webfrontend.yaml -f ns.yaml
