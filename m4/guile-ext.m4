## Autoconf macros for working with Guile.

##   Copyright (C) 2017 Free Software Foundation, Inc.

## This library is free software; you can redistribute it and/or
## modify it under the terms of the GNU Lesser General Public License
## as published by the Free Software Foundation; either version 3 of
## the License, or (at your option) any later version.

## This library is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## Lesser General Public License for more details.

## You should have received a copy of the GNU Lesser General Public
## License along with this library; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301 USA

# serial 10

## Index
## -----

## GUILE_GLOBAL_SITE_DIR -- find path to Guile "global site" directory
## GUILE_SITE_CCACHE_DIR -- find path to Guile "site-ccache" directory

## Code
## ----


# GUILE_GLOBAL_SITE_DIR -- find path to Guile global site directory
#
# Usage: GUILE_GLOBAL_SITE_DIR
#
# This looks for Guile's global site directory, usually something like
# PREFIX/share/guile/site, and sets var @var{GUILE_GLOBAL_SITE} to the
# path.  Note that the var name is different from the macro name.
#
# The variable is marked for substitution, as by @code{AC_SUBST}.
#
AC_DEFUN([GUILE_GLOBAL_SITE_DIR],
 [AC_REQUIRE([GUILE_PROGS])
  AC_MSG_CHECKING(for Guile global site directory)
  GUILE_GLOBAL_SITE=`$GUILE -c "(display (%global-site-dir))"`
  if test "$GUILE_GLOBAL_SITE" = ""; then
     AC_MSG_FAILURE(global site dir not found)
  fi
  AC_MSG_RESULT($GUILE_GLOBAL_SITE)
  AC_SUBST(GUILE_GLOBAL_SITE)
 ])


# GUILE_SITE_CCACHE_DIR -- find path to Guile "site-ccache" directory
#
# Usage: GUILE_SITE_CCACHE_DIR
#
# This looks for Guile's "site-ccache" directory, usually something
# like PREFIX/lib/guile/GUILE_EFFECTIVE_VERSION/site-ccache, and sets
# var @var{GUILE_SITE_CCACHE} to the path.  Note that the var name is
# different from the macro name.
#
# The variable is marked for substitution, as by @code{AC_SUBST}.
#
AC_DEFUN([GUILE_SITE_CCACHE_DIR],
 [AC_REQUIRE([GUILE_PROGS])
  AC_MSG_CHECKING(for Guile site ccache directory)
  GUILE_SITE_CCACHE=`$GUILE -c "(display (%site-ccache-dir))"`
  if test "$GUILE_SITE_CCACHE" = ""; then
     AC_MSG_FAILURE(site ccache dir not found)
  fi
  AC_MSG_RESULT($GUILE_SITE_CCACHE)
  AC_SUBST(GUILE_SITE_CCACHE)
 ])
