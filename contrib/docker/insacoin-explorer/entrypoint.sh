#!/bin/sh

source /insacoin.conf

set -e


if [ "$IPSTACK_API_KEY" ]
then
   sed -i -e "s~\${ipstack_api_key}~$IPSTACK_API_KEY~" \
        /workspace/app/credentials.js
fi

if [ "$RPC_HOST" ]
then
   sed -i -e "s~\${rpchost}~$RPC_HOST~" \
        /workspace/app/credentials.js
fi

if [ "$rpcuser" ] && [ "$rpcpassword" ]
then
   sed -i -e "s~\${username}~$rpcuser~" \
       -e "s~\${password}~$rpcpassword~" \
       /workspace/app/credentials.js
fi

exec "$@"
