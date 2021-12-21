#!/bin/bash
echo "!!! Cleanup /mnt local storage directory !!!"
docker exec -ti k3d-test-istio-argocd-agent-0 sh -c  "rm -rf /mnt/data;ls -laR /mnt"
docker exec -ti k3d-test-istio-argocd-server-0 sh -c "rm -rf /mnt/data;ls -laR /mnt"
