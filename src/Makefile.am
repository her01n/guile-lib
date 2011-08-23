moddir=$(prefix)/share/guile/site

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

EXTRA_DIST = $(SXML_FILES) $(TEXINFO_FILES) $(STATPROF_FILES)

else !HAVE_GUILE_COMPILE

SXML_SOURCES = $(SXML_FILES)
TEXINFO_SOURCES = $(TEXINFO_FILES)
STATPROF_SOURCES = $(STATPROF_FILES)

EXTRA_DIST =

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

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES) $(GOBJECTS)
EXTRA_DIST += $(SOURCES) $(NOCOMP_SOURCES)

CLEANFILES = $(GOBJECTS)

SUFFIXES = .scm .go
.scm.go:
	$(top_builddir)/dev-environ $(GUILE_COMPILE) -o "$@" "$<"
