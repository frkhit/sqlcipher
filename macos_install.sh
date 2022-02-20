#!/usr/bin/env bash

###################################################
# build sqlcipher for macos(x86_64)
###################################################

# echo command
set -x

# build openssl
[[ -d build/openssl/ ]] || git clone --branch OpenSSL_1_1_0-stable --depth=1 git@github.com:openssl/openssl.git build/openssl/

#pushd build/openssl/
#  ./Configure darwin64-x86_64-cc && make
#popd

# build sqlcipher
make clean
./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="`pwd`/build/openssl/libcrypto.1.1.dylib" && \
  make
