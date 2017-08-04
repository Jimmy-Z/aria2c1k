#!/bin/sh

. ./ver.sh
PREFIX=$(pwd)/dep

if [ ! -d openssl-${VER_OPENSSL} ]; then
	tar xf openssl-${VER_OPENSSL}.tar.gz && \
	cd openssl-${VER_OPENSSL} && \
	./config \
		no-shared \
		--prefix=$PREFIX && \
	make install_sw
	if [ $? -ne 0 ]; then echo !!! failed to build openssl !!!; exit; fi
	cd ..
fi

if [ ! -d expat-${VER_EXPAT} ]; then
	tar xf expat-${VER_EXPAT}.tar.bz2 && \
	cd expat-${VER_EXPAT} && \
	./configure \
		--disable-shared \
		--enable-static \
		--prefix=$PREFIX && \
	make install
	if [ $? -ne 0 ]; then echo !!! failed to build expat !!!; exit; fi
	cd ..
fi

if [ ! -d sqlite-autoconf-${VER_SQLITE} ]; then
tar xf sqlite-autoconf-${VER_SQLITE}.tar.gz && \
	cd sqlite-autoconf-${VER_SQLITE} && \
	./configure \
		--disable-shared \
		--enable-static \
		--prefix=$PREFIX && \
	make install
	if [ $? -ne 0 ]; then echo !!! failed to build sqlite !!!; exit; fi
	cd ..
fi

if [ ! -d zlib-${VER_ZLIB} ]; then
tar xf zlib-${VER_ZLIB}.tar.gz && \
	cd zlib-${VER_ZLIB} && \
	./configure \
		--prefix=$PREFIX \
		--libdir=$PREFIX/lib \
		--includedir=$PREFIX/include \
		--static && \
	make install
	if [ $? -ne 0 ]; then echo !!! failed to build zlib !!!; exit; fi
	cd ..
fi

if [ ! -d c-ares-${VER_CARES} ]; then
tar xf c-ares-${VER_CARES}.tar.gz && \
	cd c-ares-${VER_CARES} && \
	./configure \
		--disable-shared \
		--enable-static \
		--without-random \
		--prefix=$PREFIX && \
	make install
	if [ $? -ne 0 ]; then echo !!! failed to build c-ares !!!; exit; fi
	cd ..
fi

if [ ! -d libssh2-${VER_LIBSSH2} ]; then
tar xf libssh2-${VER_LIBSSH2}.tar.gz && \
	cd libssh2-${VER_LIBSSH2} && \
	./configure \
		--disable-shared \
		--enable-static \
		--prefix=$PREFIX \
		--with-openssl \
		LIBS="-lpthread -ldl" && \
	make install
	if [ $? -ne 0 ]; then echo !!! failed to build libssh2 !!!; exit; fi
	cd ..
fi

