#!/bin/sh

. ./ver.sh
PREFIX=$(pwd)/dep-mingw
HOST=x86_64-w64-mingw32

tar xf aria2-${VER_ARIA2}.tar.xz && \
cd aria2-${VER_ARIA2} && \
patch -u -p1 < ../c1k.patch && \
./configure \
	--host=$HOST \
	--prefix=$PREFIX \
	--without-included-gettext \
	--disable-nls \
	--with-libcares \
	--without-gnutls \
	--without-openssl \
	--with-sqlite3 \
	--without-libxml2 \
	--with-libexpat \
	--with-libz \
	--with-libgmp \
	--with-libssh2 \
	--without-libgcrypt \
	--without-libnettle \
	ARIA2_STATIC=yes \
	CPPFLAGS="-I$PREFIX/include" \
	LDFLAGS="-L$PREFIX/lib" \
	PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig" && \
make && \
cd src && \
$HOST-strip aria2c.exe && \
7z a -mx=9 ../../aria2c1k-${VER_ARIA2}-mingw-x86_64-static.7z aria2c.exe

