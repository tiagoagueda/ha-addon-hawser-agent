#!/bin/sh
set -e

OPTIONS="/data/options.json"

DOCKHAND_SERVER_URL=$(jq -r '.dockhand_server_url // ""' "${OPTIONS}")
TOKEN=$(jq -r '.token // ""' "${OPTIONS}")

export DOCKHAND_SERVER_URL
export TOKEN
export LOG_LEVEL="debug"

echo "[INFO] Hawser HA add-on starting"
echo "[INFO] Dockhand URL: ${DOCKHAND_SERVER_URL}"
echo "[INFO] Token set: $([ -n "${TOKEN}" ] && echo yes || echo 'NO - EMPTY')"

if [ -z "${DOCKHAND_SERVER_URL}" ] || [ -z "${TOKEN}" ]; then
  echo "[WARN] Server URL or token is empty - starting in Standard mode on port 2376"
else
  echo "[INFO] Starting in Edge mode"
fi

exec hawser
