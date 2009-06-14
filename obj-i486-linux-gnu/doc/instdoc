#!/bin/sh --

prefix=/usr
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
mandir=/usr/share/man
srcdir=../../doc
datarootdir=${prefix}/share
docdir=/usr/share/doc
includedir=${prefix}/include
top_srcdir=../..
top_builddir=..

SOURCE="$1"
TARGET="$2"


rm -f "$TARGET"

sed -e "s;/usr/local/bin/;$bindir/;g" 	 	\
    -e "s;/usr/local/doc/mutt/;$docdir/;g" 	\
    "$SOURCE" > $TARGET

chmod 644 "$TARGET"
