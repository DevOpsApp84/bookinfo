#/bin/bash
echo "Lets kill all kubectl port forwarders"
lsof -t -i :8080,8443,20001,9090,3000,9411,8088 | xargs kill -9
