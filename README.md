Insacoin
================================

https://crypto-lyon.fr

What is Insacoin?
----------------

Insacoin is a coin forked from [Litecoin](https://github.com/litecoin-project/litecoin) and built during a lesson at [INSA lyon](https://www.insa-lyon.fr/). This project might be upgraded and updated by students and members of the association. 

Installation process
--------------------
  
## On Debian 9 :
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

Two binaries built with a Debian-like are available here :  
- [insacoin-cli](https://pixeldra.in/u/82f4Se)
- [insacoind](https://pixeldra.in/u/kX3JHH)
  
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
  
Contribuer (à l'attention des élèves et en français)
----------------------------------------------------
Si vous souhaitez participer pour faire avancer le "projet" vous pouvez suivre ces 3 simples étapes :  
- Faire les modifications en local sur votre machine
- Compiler
- Si tout est OK, submit une pull request [ici](https://help.github.com/articles/creating-a-pull-request/) et [ici](https://hisham.hm/2016/01/01/how-to-make-a-pull-request-on-github-a-quick-tutorial/)  
Si vous avez du mal avec l'idée de faire une pull request, vous pouvez pour le moment nous donner vos modifications pour qu'on les push.  

**__Attention quand même__**  
Si vous modifiez des règles de consensus, vous n'appartiendrez plus au même réseau une fois les modifs compilées. Si vous êtes au moins deux à faire ça vous allez fork et devenir un réseau indépendant à-partir d'un certains moment, un nouveau coin mais qui partage une partie de l'histoire avec celui-ci (vous pourriez l'appeler INSAcoin cash).

*_Quelques idées_*
- Set une bloc reward aléatoire
- Set un halving time différent
- Mettre de meilleurs [images](https://github.com/Crypto-lyon/INSAcoin/tree/master/src/qt/res/images) que celles que je vais mettre
- ...

License
-------

Insacoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

