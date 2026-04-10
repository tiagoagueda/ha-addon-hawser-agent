#!/bin/sh
set -e

OPTIONS="/data/options.json"

SERVER=$(jq -r '.dockhand_server_url // ""' "${OPTIONS}")
TOKEN=$(jq -r '.token // ""' "${OPTIONS}")

echo "[INFO] Hawser HA add-on starting"
echo "[INFO] Dockhand URL: ${SERVER}"
echo "[INFO] Token set: $([ -n "${TOKEN}" ] && echo yes || echo 'NO - EMPTY')"

if [ -z "${SERVER}" ] || [ -z "${TOKEN}" ]; then
  echo "[WARN] Server URL or token is empty - starting in Standard mode on port 2376"
  exec hawser --log-level debug
else
  echo "[INFO] Starting in Edge mode"
  exec hawser \
    --server "${SERVER}" \
    --token "${TOKEN}" \
    --log-level debug
fi
