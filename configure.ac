dnl -*- Autoconf -*-
dnl
dnl   configuration script for Guile-Lib
dnl   Process this file with autoconf to produce configure.
dnl

define(GUILE_LIB_CONFIGURE_COPYRIGHT,[[

Copyright (C) 2016 David Pirotte
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
  [0.2.3],
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

GUILE_PKG([2.2 2.0])
dnl although no change has been made to any module, we bumped the
dnl dependency version to 2.0.12 [or higher], because it has texinfo
dnl patches so 'make check' pass.
GUILE_PROGS([2.0.12])
GUILE_SITE_DIR
GUILE_GLOBAL_SITE_DIR
GUILE_SITE_CCACHE_DIR
GUILE_FLAGS

dnl this should disappear
dnl but for now we'll keep it, it's used 'en aval'
HAVE_GUILE_COMPILE=1
GUILE_COMPILE="guild compile"
AC_SUBST(GUILE_COMPILE)
AM_CONDITIONAL(HAVE_GUILE_COMPILE, test "$HAVE_GUILE_COMPILE" = 1)

AC_CONFIG_FILES(
  [dev-environ],
  [chmod +x dev-environ])

AC_CONFIG_FILES([
  meta/guile-lib-1.0.pc
  Makefile
  src/Makefile
  doc/Makefile
  examples/Makefile
  unit-tests/Makefile
])

AC_OUTPUT
