
####
#### Copyright (C) 2016 David Pirotte
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


moddir = $(GUILE_GLOBAL_SITE)
godir= $(GUILE_SITE_CCACHE)

SXML_FILES =					\
	sxml/apply-templates.scm		\
	sxml/fold.scm				\
	sxml/simple.scm				\
	sxml/ssax/input-parse.scm		\
	sxml/ssax.scm				\
	sxml/transform.scm			\
	sxml/unicode.scm			\
	sxml/upstream/SSAX-expanded.scm		\
	sxml/upstream/SSAX.scm			\
	sxml/upstream/SXML-tree-trans.scm	\
	sxml/upstream/SXPath-old.scm		\
	sxml/upstream/input-parse.scm		\
	sxml/upstream/assert.scm		\
	sxml/xpath.scm				\
	sxml/ssax-simple.scm

# Note, texinfo/nodal-tree.scm is not in guile 2.0, so it is in SOURCES
# below.
TEXINFO_FILES =					\
	texinfo/docbook.scm			\
	texinfo/html.scm			\
	texinfo/indexing.scm			\
	texinfo/plain-text.scm			\
	texinfo/reflection.scm			\
	texinfo/serialize.scm			\
	texinfo.scm

STATPROF_FILES =				\
	statprof.scm

if HAVE_GUILE_COMPILE

# Here we assume we are using Guile 2.0, and Guile 2.0 already comes
# with the `(sxml ...)' and `(texinfo ...)' modules unmodified.

SXML_SOURCES =
TEXINFO_SOURCES =
STATPROF_SOURCES =

else !HAVE_GUILE_COMPILE

SXML_SOURCES = $(SXML_FILES)
TEXINFO_SOURCES = $(TEXINFO_FILES)
STATPROF_SOURCES = $(STATPROF_FILES)

endif !HAVE_GUILE_COMPILE


SOURCES = \
	apicheck.scm			\
	compat/guile-2.scm		\
	config/load.scm			\
	container/delay-tree.scm	\
	container/nodal-tree.scm	\
	container/async-queue.scm	\
	debugging/assert.scm		\
	debugging/time.scm		\
	graph/topological-sort.scm	\
	htmlprag.scm			\
	io/string.scm			\
	logging/logger.scm		\
	logging/port-log.scm		\
	logging/rotating-log.scm	\
	math/minima.scm			\
	math/primes.scm			\
	match-bind.scm			\
	md5.scm				\
	os/process.scm			\
	scheme/documentation.scm	\
	scheme/kwargs.scm		\
	search/basic.scm		\
	$(STATPROF_SOURCES)		\
	string/completion.scm		\
	string/soundex.scm		\
	string/transform.scm		\
	string/wrap.scm			\
        $(SXML_SOURCES)			\
	term/ansi-color.scm		\
	$(TEXINFO_SOURCES)		\
	texinfo/nodal-tree.scm		\
	text/parse-lalr.scm		\
	unit-test.scm

if HAVE_GUILE_COMPILE
GOBJECTS = $(SOURCES:%.scm=%.go)
else
GOBJECTS =
endif

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES)
nobase_go_DATA = $(GOBJECTS)

EXTRA_DIST = \
	$(SOURCES)		\
	$(NOCOMP_SOURCES)

CLEANFILES = $(GOBJECTS)

SUFFIXES = .scm .go
.scm.go:
	$(top_builddir)/dev-environ $(GUILE_COMPILE) -o "$@" "$<"

# to check/debug
printenv:
	printf '$(moddir)\n$(godir)\n'
