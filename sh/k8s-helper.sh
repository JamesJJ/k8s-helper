#!/bin/sh

# This depends on curl
curl --version >/dev/null 2>&1
if [ $? -ne 0 ];then
  echo '== Please install CURL!' 1>&2
  exit 0
fi

  
# Confirm ISTIO is ready before continuing.

if [ "X${KUBERNETES_SERVICE_HOST}" != "X" ]; then
  echo '= Waiting for ISTIO'
  i=0; while [ $i -le 30 ]; do
    i=$(( i + 1 ))
    curl --max-time 1 -sSf "http://localhost:15020/healthz/ready" && break
    sleep 1
  done
fi

