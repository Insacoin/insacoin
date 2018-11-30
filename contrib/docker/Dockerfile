FROM debian:9

ENV INSACOIN_VERSION=0.10

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
	libssl1.0-dev

RUN git clone -b ${INSACOIN_VERSION} https://github.com/Crypto-lyon/INSAcoin /opt/INSAcoin

RUN chmod +x /opt/INSAcoin/scripts/install_libdb4.8.sh
RUN /opt/INSAcoin/scripts/install_libdb4.8.sh amd64

WORKDIR /opt/INSAcoin/

RUN ./autogen.sh && \
	./configure && \ 
	make -j 4 && \
	make install

RUN apt-get purge -y --auto-remove ca-certificates build-essential libtool autotools-dev automake pkg-config bsdmainutils wget git

# Port for RPC
EXPOSE 7332
#CMD ["insacoin-qt"]
CMD ["insacoind","-txindex","-reindex"]


