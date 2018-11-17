Insacoin
================================

https://crypto-lyon.fr

What is Insacoin?
----------------

Insacoin is a coin forked from [Litecoin](https://github.com/litecoin-project/litecoin) and built during a lesson at [INSA lyon](https://www.insa-lyon.fr/). This project might be upgraded and updated by students and members of the association. 

Installation process
--------------------
  
## On Debian 9 :
  
### Building from source :
```
git clone https://github.com/Crypto-lyon/INSAcoin && cd INSAcoin
su -c 'apt install libssl1.0-dev libssl1.0.2 libssl1.1 libboost-all-dev miniupnpc build-essential libtool autotools-dev automake pkg-config libssl1.0-dev libevent-dev bsdmainutils python3 software-properties-common libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler wget git qt5-default && wget -qq https://raw.githubusercontent.com/Crypto-lyon/INSAcoin/master/cryptolyon/install_libdb4.8.sh && chmod +x install_libdb4.8.sh'
su -c './scripts/install_libdb4.8.sh amd64' # Depending on your achitecture
# OR
su -c './scripts/install_libdb4.8.sh i386' # Si vous êtes en 32bits
./autogen.sh
./configure
make
su -c 'make install'
insacoin-qt
```
  
### Installing the package
```
curl -O https://github.com/Crypto-lyon/INSAcoin/releases/download/v0.10/insacoin_0.10-1_amd64.deb
dpkg -i insacoin_0.10-1_amd64.deb
insacoin-qt
```
  
## On macos (tested on 10.11.6):
```
brew install autoconf automake openssl@1.1 libtool boost@1.59 --c++11 miniupnpc openssl pkg-config protobuf --c++11 qt5 berkeley-db4
# If not linked in /usr/local/
brew link --force openssl@1.1
brew link boost@1.59 --force
brew link --force berkeley-db4
git clone https://github.com/Crypto-lyon/INSAcoin
./autogen.sh
./configure CXXFLAGS="-std=c++11"
make -j 4
sudo make install
```
Be sure to have xcode installed.
  
### Using binaries
You can fetch a dmg image with binaries for daemon, cli, and GUI here :  
`https://github.com/Crypto-lyon/INSAcoin/releases/download/v0.10/insacoin.dmg`

Why insacoin ?
--------------

In order to teach the use of a node and how Bitcoin-like network actually works, [Crypto Lyon](https://crypto-lyon.fr) organized a series of meetup (called "from shiba to whale") in order to start a new network from scratch (insacoin) and learn by doing.
If you want to know more about it :  
- [The meetup group](https://www.meetup.com/Crypto-Lyon/)
- [The (short) recap of the first session](https://medium.com/@darosior/from-shiba-to-lion-first-session-cab6b6f50bc9)
- [Our Discord server](https://discordapp.com/invite/HRyH9va)
  
License
-------

Insacoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

