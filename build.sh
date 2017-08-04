#!/bin/sh

. ./ver.sh
PREFIX=$(pwd)/dep

tar xf aria2-${VER_ARIA2}.tar.xz && \
cd aria2-${VER_ARIA2} && \
patch -u -p1 < ../c1k.patch && \
./configure \
	--prefix=$PREFIX \
	--with-libcares \
	--without-gnutls \
	--with-openssl \
	--with-sqlite3 \
	--without-libxml2 \
	--with-libexpat \
	--with-libz \
	--without-libgmp \
	--with-libssh2 \
	--without-libgcrypt \
	--without-libnettle \
	ARIA2_STATIC=yes \
	CPPFLAGS="-I$PREFIX/include" \
	LDFLAGS="-L$PREFIX/lib -lpthread" \
	PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig" && \
make && \
cd src && \
strip aria2c && \
7z a -mx=9 ../../aria2c1k-${VER_ARIA2}-linux-x86_64-static.7z aria2c

