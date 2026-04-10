#!/usr/bin/with-contenv bashio

bashio::require.unprotected

SERVER="$(bashio::config 'dockhand_server_url')"
TOKEN="$(bashio::config 'token')"

bashio::log.info "Hawser HA add-on starting"
bashio::log.info "Dockhand URL: ${SERVER}"
bashio::log.info "Token set: $([ -n "${TOKEN}" ] && echo yes || echo NO - EMPTY)"

if bashio::var.is_empty "${SERVER}" || bashio::var.is_empty "${TOKEN}"; then
  bashio::log.warning "Server URL or token is empty - starting in Standard mode on port 2376"
  exec hawser --log-level debug
else
  bashio::log.info "Starting in Edge mode"
  exec hawser \
    --server "${SERVER}" \
    --token "${TOKEN}" \
    --log-level debug
fi
