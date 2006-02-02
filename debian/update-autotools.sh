#! /bin/sh

set -e

D="$1" # mutt-1.5.X
PATCH_NAME=misc/autotools-update.diff 

cd $D
dh_testdir
debclean
quilt delete $PATCH_NAME || test $? -eq 1
quilt push -aq
ln -sf /usr/share/misc/config.sub .
ln -sf /usr/share/misc/config.guess .
cd -

cp -al $D $D.orig

cd $D 
aclocal -I m4
autoheader
( cd m4 && make -f Makefile.am.in )
automake
autoconf
cd ..

T=`mktemp $D/diff.XXXXXX`
diff -ru $D.orig $D >$T || test $? -eq 1
patch -p1 -R -d $D <$T

cd $D
quilt import -f -n $PATCH_NAME `basename $T`
quilt push
cd -

rm -f $T
rm -rf $D.orig
