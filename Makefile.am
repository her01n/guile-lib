
####
#### Copyright (C) 2018 David Pirotte
#### David Pirotte <david at altosw dot be>

#### This file is part of Guile-Lib.

#### Guile-Lib is free software: you can redistribute it, as a whole,
#### and/or modify it under the terms of the GNU General Public
#### License as published by the Free Software Foundation, either
#### version 3 of the License, or (at your option) any later version.

#### Each Guile-Lib module contained in Guile-Lib has its own copying
#### conditions, specified in the comments at the beginning of the
#### module's source file.

#### Guile-Lib is distributed in the hope that it will be useful, but
#### WITHOUT ANY WARRANTY; without even the implied warranty of
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#### General Public License for more details.

#### You should have received a copy of the GNU General Public License
#### along with Guile-Lib.  If not, see
#### <http://www.gnu.org/licenses/>.
####


pkgconfigdir=$(libdir)/pkgconfig
pkgconfig_DATA=meta/guile-lib-1.0.pc

SUBDIRS = 		\
	src 		\
	doc 		\
	examples	\
	unit-tests

ACLOCAL_AMFLAGS = -I m4

EXTRA_DIST = \
	AUTHORS				\
	ChangeLog			\
	COPYING				\
	COPYING.GPL			\
	COPYING.LGPL			\
	INSTALL				\
	NEWS				\
	README				\
	pre-inst-env.in			\
	meta/guile-lib-1.0.pc.in	\
	$(wildcard am/*)		\
	$(wildcard m4/*)


distclean-local:
	rm -f Makefile.in
	rm -f aclocal.m4
	rm -rf autom4te.cache
	rm -rf build-aux
	rm -f configure
	rm -f pre-inst-env
	rm -f meta/guile-lib-1.0.pc
	rm -f *~
	rm -f guile-lib-*.tar.gz
	rm -f src/*~
	rm -f src/TAGS
	rm -f src/Makefile.in
	rm -f examples/Makefile.in
	rm -f unit-tests/Makefile.in
