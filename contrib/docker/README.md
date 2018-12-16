## Docker instructions

### Create configuration for INSAcoin

```shell
mkdir .insacoin || cat > .insacoin/insacoin.conf <<EOF
rpcuser=insacoinrpc
rpcpassword=CHANGE_THIS

# To get all transactions data
txindex=1

# Allowing your host to access INSAcoin RPC running in the container
rpcallowip=172.17.0.0/16

# Tells insacoin-qt and insacoind to accept JSON-RPC commands
server=1
EOF
```

### Building INSAcoin headless

```shell
docker build -t insacoin insacoin-headless/
```

### Building INSAcoin UI
```shell
docker build -t insacoin insacoin-ui/
```
### Launching INSAcoin UI
```shell
xhost +local:docker && \
      docker run -ti --rm --name insacoin \
      -e DISPLAY=$DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v ~/.insacoin:/root/.insacoin \
      insacoin \
      insacoin-qt -server=1 -txindex=1 -rpcallowip=172.17.0.0/16
```

### Launching INSAcoin headless
```shell
docker run -d --name insacoin \
   -v ~/.insacoin:/root/.insacoin \
   -p 7332:7332 \
   -p 7333:7333 \
   -p 17332:17332 \
   -p 17333:17333 \
   -p 19444:19444 \
   gnut3ll4/insacoin:0.10-headless
```

### Launching INSAcoin core & explorer

Set variables in docker-compose.yml, then run the following commands :

```shell
docker-compose build
# OR
docker-compose pull

docker-compose up
```


