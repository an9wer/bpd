# SSD

SSD, which means shadowsocks docker, is a project intended to deploy
shadowsocks quickly.

## Usage

First, modify `config.json` file, which is a configuration file of shadowsocks
(see [basic configuration][0] and [multiple user configuration][1] in config.json)
and then execute the following commands in order:

    docker build -t shadowsocks_image .

    docker run -d --network host --name shadowsocks_container shadowsocks_image

[0]: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
[1]: https://github.com/shadowsocks/shadowsocks/wiki/Configure-Multiple-Users
