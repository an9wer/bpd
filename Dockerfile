FROM base/archlinux

LABEL maintainer.name="an9wer"
LABEL maintainer.email="an9wer@gmail.com"

SHELL ["/bin/bash", "-c"]

USER root:root

RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm git python libsodium

WORKDIR /app
RUN git clone -b master https://github.com/shadowsocks/shadowsocks.git

WORKDIR /app/shadowsocks
CMD ["python", "-m", "shadowsocks.server", "-c", "config.json"]
