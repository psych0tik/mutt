#! /bin/sh

set -e

diff="${1-debian/patches/autotools-update}"
rm -f "$diff"

dh_testdir
debclean
make -f debian/sys-build.mk source.patch
cd build-tree

D=`echo *`
cp -al $D $D.orig

cd $D 
aclocal -I m4
autoheader
(cd m4 && make -f Makefile.am.in )
automake
autoconf
cd ..

diff -ru $D.orig $D >"../$diff"
