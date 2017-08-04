#!/bin/sh

. ./ver.sh

CURL="curl -J -L -O "${CURL_OPTS}

test -f aria2-${VER_ARIA2}.tar.xz || \
	$CURL https://github.com/aria2/aria2/releases/download/release-${VER_ARIA2}/aria2-${VER_ARIA2}.tar.xz
test -f gmp-${VER_GMP}.tar.lz || \
	$CURL https://gmplib.org/download/gmp/gmp-${VER_GMP}.tar.lz
test -f openssl-${VER_OPENSSL}.tar.gz || \
	$CURL https://www.openssl.org/source/openssl-${VER_OPENSSL}.tar.gz
test -f expat-${VER_EXPAT}.tar.bz2 || \
	$CURL http://downloads.sourceforge.net/project/expat/expat/${VER_EXPAT}/expat-${VER_EXPAT}.tar.bz2
test -f sqlite-autoconf-${VER_SQLITE}.tar.gz || \
	$CURL https://www.sqlite.org/${YEAR_SQLITE}/sqlite-autoconf-${VER_SQLITE}.tar.gz
test -f zlib-${VER_ZLIB}.tar.gz || \
	$CURL http://zlib.net/zlib-${VER_ZLIB}.tar.gz
test -f c-ares-${VER_CARES}.tar.gz || \
	$CURL https://c-ares.haxx.se/download/c-ares-${VER_CARES}.tar.gz
test -f libssh2-${VER_LIBSSH2}.tar.gz || \
	$CURL https://libssh2.org/download/libssh2-${VER_LIBSSH2}.tar.gz

