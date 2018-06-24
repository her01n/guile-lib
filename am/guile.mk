
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


moddir=@SITEDIR@
godir=@SITECCACHEDIR@


GOBJECTS = $(SOURCES:%.scm=%.go)

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES)
nobase_go_DATA = $(GOBJECTS)

# Make sure source files are installed first, so that the mtime of
# installed compiled files is greater than that of installed source
# files.  See
# <http://lists.gnu.org/archive/html/guile-devel/2010-07/msg00125.html>
# for details.
guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_modDATA

GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat

SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env \
	guild compile $(GUILE_WARNINGS) -o "$@" "$<"
