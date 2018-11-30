FROM alpine

LABEL maintainer.name="an9wer"
LABEL maintainer.email="an9wer@gmail.com"

SHELL ["/bin/sh", "-c"]

USER root:root

RUN apk update && apk upgrade
RUN apk add --no-cache git python libsodium

WORKDIR /app
RUN git clone -b master https://github.com/shadowsocks/shadowsocks.git

WORKDIR /app/shadowsocks
CMD ["python", "-m", "shadowsocks.server", "-c", "config.json"]
