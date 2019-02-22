## Usage

First, create a file named with `config.json`, which is a configuration file
used by shadowsocks (see [basic configuration][0] and [multiple user
configuration][1] about how, you can also find an example in
`config.json.example`).

Then use the following commands to deploy shadowsocks:

1.  Build a docker image of shadowsocks:

        sudo make

2.  After building, create a docker container of that:

        sudo make run

Every time when changing the content of `config.json`, you need to restart
docker container as follows:

    sudo make restart

**Note**: The commands above by default will create an image named with
`shadowsocks_image` and a container, whose name is `shadowsocks_container`,
seperately. If needed to change their names, add `IMAGE={name}` and
`CONTAINER={name}` arguments when running the commands above.

[0]: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
[1]: https://github.com/shadowsocks/shadowsocks/wiki/Configure-Multiple-Users

