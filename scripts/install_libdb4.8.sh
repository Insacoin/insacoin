#!/bin/bash

if [ "$#" -ne "1" ]; then
	echo "usage :"
	echo "	$0 <amd64|i386>"
elif ! [ "$1" = "amd64" ] && ! [ "$1" = "i386" ] ; then
	echo "Bad architecture argument. must be amd64 or i386."
else
	mkdir "tmplibdb" && cd "tmplibdb"
	if [ "$1" = "amd64" ] ; then
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8_4.8.30-trusty1_amd64.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8-dev_4.8.30-trusty1_amd64.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8++_4.8.30-trusty1_amd64.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8++-dev_4.8.30-trusty1_amd64.deb"
	elif [ "$1" = "i386" ] ; then
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8_4.8.30-trusty1_i386.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8-dev_4.8.30-trusty1_i386.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8++_4.8.30-trusty1_i386.deb"
		wget -qq "https://launchpad.net/~bitcoin/+archive/ubuntu/bitcoin/+files/libdb4.8++-dev_4.8.30-trusty1_i386.deb"
	fi
	dpkg -i *.deb
	cd .. && rm -rf "tmplibdb"
fi


