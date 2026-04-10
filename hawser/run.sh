#!/usr/bin/with-contenv bashio

bashio::require.unprotected

bashio::log.info "Hawser HA add-on starting"
bashio::log.info "Dockhand URL: $(bashio::config 'dockhand_server_url')"

exec hawser \
  --server "$(bashio::config 'dockhand_server_url')" \
  --token "$(bashio::config 'token')" \
  --log-level debug
