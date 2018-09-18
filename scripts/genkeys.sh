#!/bin/bash

mkdir tmpkeys && cd tmpkeys
openssl ecparam -genkey -name secp256k1 -out alertkey.pem 2>/dev/null
openssl ec -in alertkey.pem -text > alertkey.hex 2>/dev/null
openssl ecparam -genkey -name secp256k1 -out genesiscoinbase.pem 2>/dev/null
openssl ec -in genesiscoinbase.pem -text > genesiscoinbase.hex 2>/dev/null
alertpub=$(cat alertkey.hex |grep 'pub:' -A5|sed -e 's/\(:\|pub\)//g'|awk NF=NF RS= OFS=)
genesispub=$(cat genesiscoinbase.hex |grep 'pub:' -A5|sed -e 's/\(:\|pub\)//g'|awk NF=NF RS= OFS=)
cd .. && rm -rf tmpkeys
echo "Clef d'alerte : $alertpub"
echo ""
echo "Clef coinbase : $genesispub"
