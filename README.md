# SSD

SSD, which means shadowsocks docker, is a project intended to deploy
shadowsocks quickly and esaily.

## Usage

First, modify the file `config.json`, which is a configuration file of
shadowsocks (see [basic configuration][0] and [multiple user configuration][1]
about how to configure it), and then execute the following commands in order to
deploy shadowsocks:

    sudo docker build -t shadowsocks_image .

    sudo docker run -d --network host --name shadowsocks_container --mount type=bind,source="$(pwd)"/config.json,target=/app/shadowsocks/config.json,readonly shadowsocks_image 

Everytime you re-configure the file `config.json`, just restart docker
container as follows:

    sudo docker restart shadowsocks_container

[0]: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
[1]: https://github.com/shadowsocks/shadowsocks/wiki/Configure-Multiple-Users
