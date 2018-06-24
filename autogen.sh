#!/bin/sh
# Run this to generate all the initial makefiles, etc.

set -e

# fool automake
echo '@setfilename guile-library.info' > doc/guile-library.texi
touch -d 'jan 23 1980' doc/guile-library.texi

# configure.ac uses the guile.m4 GUILE_FLAGS macro, among others,
# which needs build-aux/config.rpath which is not installed anymore by
# modern version of automake, and without it, this script will raise
# an error. For why it's needed, see the comments wtr in m4/guile.m4.
if [ ! -d "build-aux" ]; then
    mkdir build-aux
fi
touch build-aux/config.rpath

autoreconf -vif

echo
echo "Now run ./configure [--prefix=/your/prefix] [--with-guile-site=yes]"
