FROM alpine as builder

SHELL ["/bin/sh", "-c"]
USER root:root

RUN apk update && apk upgrade
RUN apk add --no-cache musl-dev git go
RUN go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/client
RUN go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/server


FROM alpine

LABEL maintainer.name="an9wer"
LABEL maintainer.email="an9wer@gmail.com"

SHELL ["/bin/sh", "-c"]
USER root:root
COPY --from=builder /root/go/bin /bin

WORKDIR /app/kcptun
#CMD ["go", "run", "github.com/xtaci/kcptun/server", "-c", "config.json"]
CMD ["server", "-c", "server.json"]
