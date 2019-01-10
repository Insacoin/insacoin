Insacoin
================================

What is Insacoin?
----------------

Insacoin is a coin forked from [Litecoin](https://github.com/litecoin-project/litecoin) and built during a lesson at [INSA lyon](https://www.insa-lyon.fr/). This project is maintained by students and members of the [Crypto Lyon association/community](https://crypto-lyon.fr).

Installation process
--------------------

## On Debian 9 :
```shell
git clone https://github.com/Insacoin/insacoin && cd insacoin
su -c 'apt install libssl1.0-dev libssl1.0.2 libssl1.1 libboost-all-dev miniupnpc build-essential libtool autotools-dev automake pkg-config libssl1.0-dev libevent-dev bsdmainutils python3 software-properties-common libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler wget git qt5-default'
su -c './scripts/install_libdb4.8.sh amd64' # Depending on your achitecture
# OR
su -c './scripts/install_libdb4.8.sh i386' # Si vous êtes en 32bits
./autogen.sh
./configure
make
# Optional
su -c 'make install'
insacoin-qt
```
You can revert global installation with make uninstall.

Two binaries built with a Debian-like are available here :
- [insacoin-cli](https://pixeldra.in/u/82f4Se)
- [insacoind](https://pixeldra.in/u/kX3JHH)

## On macos (tested on 10.11.6):
Please install [homebrew](https://brew.sh) and [macports](https://www.macports.org/). Be sure to have [Xcode](https://developer.apple.com/xcode/) installed.
```shell
brew install openssl miniupnpc libtool autoconf automake pkg-config libevent python3 berkeley-db4 qt5 protobuf moc git wget
brew install --with-pgm zeromq
brew tap b4hand/bsdmainutils
brew install bsdmainutils
brew install boost@1.59 --c++11
export LDFLAGS="-L/usr/local/opt/boost@1.59/lib"
export CPPFLAGS="-I/usr/local/opt/boost@1.59/include"
sudo port install db48 miniupnpc
git clone https://github.com/Insacoin/insacoin
./autogen.sh
./configure CXXFLAGS="-std=c++11"
make -j 4
# Optional
sudo make install
```
You can revert global installation with make uninstall.

Setup Insacoin in a Docker container
------

### Building and running INSAcoin docker image

Run the following commands to compile INSAcoin in Docker and build the image :

```shell
cd contrib/docker
docker build --rm -t insacoin .
```

Launch Insacoin daemon :

```shel
# create ~/.insacoin/insacoin.conf file with rpcuser and rpcpassword

mkdir .insacoin || cat > .insacoin/insacoin.conf <<EOF
rpcuser=bitcoinrpc
rpcpassword=CHANGE_THIS
txindex=1
EOF

# run docker
docker run -d -v ~/.insacoin:/root/.insacoin \
       -p 7332:7332 \
       --name insacoin \
       insacoin \
       insacoind -txindex -rpcallowip=172.17.0.0/16
# or with docker-compose
docker-compose up -d
```

Using insacoin-cli :

```shell
docker exec -it insacoin insacoin-cli getinfo
```

### Running Insacoin UI

```shell
xhost +local:docker && docker run -ti --rm --name insacoin -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.insacoin:/root/.insacoin insacoin insacoin-qt
```

Setup Autocompletion
-------

Run the following commands :

```shell
sudo cp contrib/insacoind.bash-completion /etc/bash_completion.d/
source /etc/bash_completion.d/insacoind.bash-completion
```

If you are using docker and want to use insacoin-cli as if it was installed :

```shell
sudo cat > /usr/local/bin/insacoin-cli << EOF
#!/bin/bash
docker exec -it insacoin insacoin-cli $@
EOF
```



License
-------

Insacoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

