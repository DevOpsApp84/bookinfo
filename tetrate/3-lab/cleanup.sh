#!/bin/bash
kubectl delete -f customers-dr.yaml  -f customers-v1.yaml  -f customers-v2.yaml \
	       -f customers-vs.yaml  -f gateway.yaml -f  webfrontend-vs.yaml \
	       -f webfrontend.yaml -f ns.yaml
