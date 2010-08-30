dnl -*- Autoconf -*-

AC_INIT(guile-lib, 0.1.9)
AC_CONFIG_SRCDIR(src/md5.scm)
AM_INIT_AUTOMAKE([gnu check-news color-tests -Wall -Wno-portability])

AC_SUBST(ACLOCAL_FLAGS,$ACLOCAL_FLAGS)

GUILE_PROGS
GUILE_FLAGS

if $GUILE_TOOLS | grep -q compile; then
   GUILE_COMPILE="$GUILE_TOOLS compile"
   HAVE_GUILE_COMPILE=1
else
   GUILE_COMPILE=""
   HAVE_GUILE_COMPILE=0
fi

AC_SUBST(GUILE_COMPILE)
AM_CONDITIONAL(HAVE_GUILE_COMPILE, test "$HAVE_GUILE_COMPILE" = 1)

AC_CONFIG_FILES([
Makefile
src/Makefile
doc/Makefile
examples/Makefile
unit-tests/Makefile
])
AC_CONFIG_FILES([dev-environ], [chmod +x dev-environ])

AC_OUTPUT
