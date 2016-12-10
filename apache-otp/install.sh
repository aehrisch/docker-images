#!/bin/ash

echo "### Installing mod-authn-otp from sources"

apk update
apk add apache2 apache2-dev autoconf automake build-base 

mkdir -p /tmp/build 
cd /tmp/build
tar xzf src.tar.gz
cd "mod-authn-otp-${module_ver}" 
./autogen.sh 
./configure
make install

echo "### Cleanup"

cd /tmp 
rm -fr /tmp/build
apk del -r apache2-dev autoconf automake build-base
rm -f /var/cache/apk/*

