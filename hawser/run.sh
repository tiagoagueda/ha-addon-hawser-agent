#!/usr/bin/with-contenv sh

echo "[INFO] Hawser HA add-on starting"
echo "[INFO] Dockhand URL: ${dockhand_server_url}"

# Dump what's in /var/run for diagnostics
echo "[DEBUG] Contents of /var/run:"
ls -la /var/run/ 2>/dev/null || echo "[WARN] Cannot list /var/run"

# Check for docker socket
DOCKER_SOCK="/var/run/docker.sock"

if [ ! -S "${DOCKER_SOCK}" ]; then
  echo "[ERROR] Docker socket NOT found at ${DOCKER_SOCK}"
  echo "[ERROR] This addon requires 'map: docker_socket' in config.yaml and the HA Supervisor must support it."
  echo "[ERROR] Make sure Protection Mode is disabled for this addon in the HA UI."
  exit 1
fi

echo "[INFO] Docker socket found at ${DOCKER_SOCK}"

exec hawser \
  --server "${dockhand_server_url}" \
  --token "${token}" \
  --log-level debug
