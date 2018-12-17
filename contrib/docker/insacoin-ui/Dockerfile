FROM debian:9

ENV INSACOIN_VERSION=0.10
WORKDIR /opt/INSAcoin/

RUN apt update && \
	apt install -y --no-install-recommends \
	libboost-all-dev \
	miniupnpc build-essential \
	libtool \
	autotools-dev \
	automake \
	pkg-config \
	libevent-dev \
	bsdmainutils \
	python3 \
	software-properties-common \
	libminiupnpc-dev \
	libzmq3-dev \
	libqt5gui5 \
	libqt5core5a \
	libqt5dbus5 \
	qttools5-dev \
	qttools5-dev-tools \
	libprotobuf-dev \
	protobuf-compiler \
	wget \
	git \
	qt5-default \
	libssl1.0-dev && \
	git clone -b ${INSACOIN_VERSION} https://github.com/Crypto-lyon/INSAcoin /opt/INSAcoin && \
	chmod +x /opt/INSAcoin/scripts/install_libdb4.8.sh && \
	/opt/INSAcoin/scripts/install_libdb4.8.sh amd64 && \
	./autogen.sh && \
	./configure && \ 
	make -j 4 && \
	make install && \
	apt-get purge -y --auto-remove ca-certificates build-essential libtool autotools-dev automake pkg-config bsdmainutils wget git

#JSON/RPC Port
EXPOSE 7332

#Peer to peer port
EXPOSE 7333 

#Testnet ports
EXPOSE 17332 17333 

#Regtest port
EXPOSE 19444

CMD ["insacoin-qt", "-txindex", "-rpcallowip=172.17.0.0/16", "-server=1"]


