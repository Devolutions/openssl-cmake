#!/bin/sh

OPENSSL_DIR=$1

cp CMakeLists.txt $OPENSSL_DIR/
cp c_rehash.cmake $OPENSSL_DIR/
cp opensslconf.h.cmake $OPENSSL_DIR/
cp apps/CMakeLists.txt $OPENSSL_DIR/apps/
cp apps/CA.pl.cmake $OPENSSL_DIR/apps/
cp apps/progs.h.cmake $OPENSSL_DIR/apps/
cp apps/tsget.cmake $OPENSSL_DIR/apps/
cp crypto/CMakeLists.txt $OPENSSL_DIR/crypto/
cp crypto/bn_conf.h.cmake $OPENSSL_DIR/crypto/
cp crypto/buildinf.h.cmake $OPENSSL_DIR/crypto/
cp crypto/dso_conf.h.cmake $OPENSSL_DIR/crypto/
cp ssl/CMakeLists.txt $OPENSSL_DIR/ssl/
