ARG BUILD_FROM
FROM ghcr.io/finsys/hawser:latest

RUN apk add --no-cache jq

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
