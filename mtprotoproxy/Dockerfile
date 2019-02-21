FROM alpine

LABEL maintainer.name="an9wer"
LABEL maintainer.email="an9wer@gmail.com"

SHELL ["/bin/sh", "-c"]

USER root:root

RUN apk update && apk upgrade
RUN apk add --no-cache git python3 py3-cryptography ca-certificates libcap
RUN setcap cap_net_bind_service=+ep $(realpath $(which python3))
RUN adduser -S tgproxy
RUN mkdir /app && chmod 1777 /app


USER tgproxy

WORKDIR /app
RUN git clone -b master https://github.com/alexbers/mtprotoproxy.git

WORKDIR /app/mtprotoproxy
CMD ["python3", "mtprotoproxy.py", "config.py"]
