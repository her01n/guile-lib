
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


TEST_SXML_FILES = \
	sxml.fold.scm			\
	sxml.ssax.scm			\
	sxml.transform.scm		\
	sxml.xpath.scm

TEST_TEXINFO_FILES = \
	texinfo.scm			\
	texinfo.docbook.scm		\
	texinfo.serialize.scm		\
	text.parse-lalr.scm

TEST_STATPROF_FILES = \
	statprof.scm


if HAVE_GUILE_COMPILE

TEST_SXML_SOURCES =
TEST_TEXINFO_SOURCES =
TEST_STATPROF_SOURCES =

else !HAVE_GUILE_COMPILE

TEST_SXML_SOURCES = $(TEST_SXML_FILES)
TEST_TEXINFO_SOURCES = $(TEST_TEXINFO_FILES)
TEST_STATPROF_SOURCES = $(TEST_STATPROF_FILES)

endif !HAVE_GUILE_COMPILE

TESTS= \
	api.scm				\
	container.async-queue.scm	\
	graph.topological-sort.scm	\
	htmlprag.scm			\
	logging.logger.scm		\
	match-bind.scm			\
	math.minima.scm			\
	math.primes.scm			\
	md5.scm				\
	os.process.scm			\
	search.basic.scm		\
	$(TEST_STATPROF_SOURCES)	\
	scheme.kwargs.scm		\
	string.completion.scm		\
	string.transform.scm		\
	string.wrap.scm			\
	$(TEST_SXML_SOURCES)		\
	term.ansi-color.scm		\
	$(TEST_TEXINFO_SOURCES)

TESTS_ENVIRONMENT=							\
	API_FILE=$(srcdir)/guile-library.api				\
	DOC_GUILE_LIBRARY_SCM=$(top_srcdir)/doc/guile-library.scm	\
	GUILE_AUTO_COMPILE=0						\
	$(top_builddir)/dev-environ $(GUILE) -s

script := '(load (getenv "DOC_GUILE_LIBRARY_SCM"))\
(for-each \
(lambda (mod) \
(display " \"") (write (car mod)) (display "\" ")) \
 *modules*)'

guile-library.api.update:
	$(top_builddir)/dev-environ $(srcdir)/update-api \
	$(shell DOC_GUILE_LIBRARY_SCM=$(top_srcdir)/doc/guile-library.scm \
	   guile -c $(script)) > $(srcdir)/guile-library.api

%.check: %
	$(TESTS_ENVIRONMENT) $(srcdir)/$*

EXTRA_DIST = \
	$(TESTS)		\
	guile-library.api
