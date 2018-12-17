FROM debian:9-slim as base

ENV BERKELEYDB_VERSION=db-4.8.30.NC
ENV BERKELEYDB_PREFIX=/opt/${BERKELEYDB_VERSION}
ENV INSACOIN_VERSION=0.10
ENV INSACOIN_PREFIX=/opt/insacoin-${INSACOIN_VERSION}


FROM base as dependencies

RUN apt update && \
	apt install -y --no-install-recommends \
	miniupnpc \
	libboost-all-dev \
	libssl1.0-dev \
	libevent-dev \
	libminiupnpc-dev \
	libzmq3-dev


FROM dependencies as build

RUN apt update && \
	apt install -y --no-install-recommends \
	wget \
	build-essential \
	ca-certificates \
	file


FROM build as build-berkeleydb

RUN wget https://download.oracle.com/berkeley-db/${BERKELEYDB_VERSION}.tar.gz && \
	tar -xzf *.tar.gz && rm *.tar.gz && \
	mkdir -p ${BERKELEYDB_PREFIX} && \
	${BERKELEYDB_VERSION}/dist/configure --enable-cxx --disable-shared --disable-replication --with-pic --prefix=${BERKELEYDB_PREFIX} && \
	make -j 4 && \ 
	make install && \
	rm -rf ${BERKELEYDB_PREFIX}/docs 


FROM build as build-insacoin

COPY --from=build-berkeleydb /opt /opt

RUN apt install -y --no-install-recommends \
	autoconf \
	automake \
	libtool \
	pkg-config \
	bsdmainutils \
	git

RUN git clone -b ${INSACOIN_VERSION} https://github.com/insacoin/insacoin /tmp/insacoin

RUN cd /tmp/insacoin && \
	./autogen.sh && \
	./configure LDFLAGS=-L`ls -d /opt/db*`/lib/ CPPFLAGS=-I`ls -d /opt/db*`/include/ \
	--prefix=${INSACOIN_PREFIX} \
	--mandir=/usr/share/man \
	--disable-tests \
	--disable-bench \
	--disable-ccache \
	--with-gui=no \
	--with-utils \
	--with-libs \
	--with-daemon && \
	make -j4 && \
	make install

FROM dependencies as insacoin-core

COPY --from=build-berkeleydb /opt /opt
COPY --from=build-insacoin /opt /opt

ENV PATH=${INSACOIN_PREFIX}/bin:$PATH

#JSON/RPC Port
EXPOSE 7332

#Peer to peer port
EXPOSE 7333 

#Testnet ports
EXPOSE 17332 17333 

#Regtest port
EXPOSE 19444

CMD ["insacoind","-txindex", "-rpcallowip=172.17.0.0/16"]
