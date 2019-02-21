## Usage

### Server

First, create a file named with `server.json`, which is a configuration file
used by kcptun server (find an example in `server.json.example`).

Then run the follwoing commands to deploy kcptun server:

1.  Build a docker image of kcptun server:

        sudo make

2.  After building, create a docker container of that:

        sudo make run

Every time when change the content of `server.json`, you need to restart docker
container as follows:

    sudo make restart

**Note**: The commands above will by default create a image named with
`kcptun_server_image` and a container whose name is `kcptun_server_container`
seperately. If need to change these names, add `IMAGE={name}` and
`CONTAINER={name}` arguments when running the commands above.

### Client

First, create a file named with `client.json`, which is a configuration file
used by kcptun client (find an example in `client.json.example`).

Then run the follwoing commands to deploy kcptun client:

1.  Build a docker image of kcptun client:

        sudo make target=client

2.  After building, create a docker container of that:

        sudo make target=client run

Every time when change the content of `client.json`, you need to restart docker
container as follows:

    sudo make target=client restart

**Note**: The commands above will by default create a image named with
`kcptun_client_image` and a container whose name is `kcptun_client_container`
seperately. If need to change these names, add `IMAGE={name}` and
`CONTAINER={name}` arguments when running the commands above.

