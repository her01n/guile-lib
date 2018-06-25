dnl -*- Autoconf -*-
dnl
dnl   configuration script for Guile-Lib
dnl   Process this file with autoconf to produce configure.
dnl

define(GUILE_LIB_CONFIGURE_COPYRIGHT,[[

Copyright (C) 2016 -  2018 David Pirotte
David Pirotte <david at altosw dot be>

This file is part of Guile-Lib.

Guile-Lib is free software: you can redistribute it, as a whole,
and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation, either
version 3 of the License, or (at your option) any later version.

Each Guile-Lib module contained in Guile-Lib has its own copying
conditions, specified in the comments at the beginning of the
module's source file.

Guile-Lib is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with Guile-Lib.  If not, see
<http://www.gnu.org/licenses/>.

]])

AC_PREREQ(2.69)

dnl let's bump the version to x.x.x-dev while working on the devel
dnl branch, so who ever uses it and/or run 'make dist' or 'make
dnl distcheck' are aware it is a wip version.
AC_INIT(
  [guile-lib],
  [0.2.5.1],
  [guile-devel at gnu dor org])

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])

dnl Use `serial-tests' so the output `check-guile' is not hidden
dnl (`parallel-tests' is the default in Automake 1.13.)
dnl `serial-tests' was introduced in Automake 1.12.
AM_INIT_AUTOMAKE([1.14 gnu -Wall -Wno-portability -Wno-syntax \
  color-tests serial-tests foreign])
AM_MAINTAINER_MODE([enable])
AM_SILENT_RULES([yes])

AC_COPYRIGHT(GUILE_LIB_CONFIGURE_COPYRIGHT)
AC_CONFIG_SRCDIR(src/md5.scm)

AC_SUBST(ACLOCAL_FLAGS,$ACLOCAL_FLAGS)

GUILE_PKG([3.0 2.2 2.0])
dnl although no change has been made to any module, we bumped the
dnl dependency version to 2.0.12 [or higher], because it has texinfo
dnl patches so 'make check' pass.
GUILE_PROGS([2.0.12])
GUILE_SITE_DIR
GUILE_GLOBAL_SITE_DIR
GUILE_SITE_CCACHE_DIR
GUILE_FLAGS


AC_ARG_WITH(
  [guile-site],
  [AS_HELP_STRING(
     [--with-guile-site],
     [install source modules and compiled files using Guile's site and site-ccache dirs])],
  [case "x$withval" in
     xyes)
     guile_site="yes";;
     *)
     guile_site="";;
   esac],
  [guile_site=""])

if test "x$guile_site" = "xyes"; then
   SITEDIR="$GUILE_GLOBAL_SITE";
   SITECCACHEDIR="$GUILE_SITE_CCACHE";
else
   SITEDIR="$datadir/guile-lib";
   SITECCACHEDIR="$libdir/guile-lib/guile/$GUILE_EFFECTIVE_VERSION/site-ccache";
fi
AC_SUBST([SITEDIR])
AC_SUBST([SITECCACHEDIR])


AC_CONFIG_FILES(
  [pre-inst-env],
  [chmod +x pre-inst-env])

AC_CONFIG_FILES([
  meta/guile-lib-1.0.pc
  Makefile
  src/Makefile
  doc/Makefile
  examples/Makefile
  unit-tests/Makefile
])

AC_OUTPUT

AC_MSG_NOTICE(
  []
  []
  [prefix=${prefix}]
  [exec_prefix=${exec_prefix}]
  [datarootdir=${datarootdir}]
  [sitedir (source code): ${SITEDIR}]
  [siteccachedir (compiled modules): ${SITECCACHEDIR}]
  [])

if test "x$guile_site" = "x"; then
  AC_MSG_WARN(
    []
    [The above last two variables differs from the one used by Guile itself,]
    [you have to augment Guile's both %load-path and %load-compiled-path]
    [variables (see 'Environment Variables' in Guile Reference Manual)]
    [before to use Guile-Lib's modules.]
    [])
fi
