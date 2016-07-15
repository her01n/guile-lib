
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


clean-docs:
	rm -f $(doc).texi
	rm -f $(doc).info
	rm -f html-stamp
	rm -rf html
	rm -f $(addprefix $(doc).,aux cp cps fn fns ky log pdf pg toc tp tps vr vrs)
	rm -rf $(doc).html

EXTRA_DIST = 			\
	$(doc).scm		\
	make-texinfo.scm	\
	make-html.scm		\
	docs.mk

DISTCLEANFILES =	\
	Makefile.in

depfiles = $(shell $(GUILE) --no-auto-compile --debug --use-srfi=13 -l $(srcdir)/$(doc).scm -c '(for-each (lambda (m) (format \#t "$(top_srcdir)/src/~a.scm " (string-join (map symbol->string m) "/"))) (map car *modules*))')

dummy:
	printf '$(depfiles)'

$(doc).texi: $(srcdir)/$(doc).scm $(depfiles)
	GUILE_AUTO_COMPILE=0								\
	$(top_builddir)/dev-environ $(srcdir)/make-texinfo.scm $(srcdir)/$(doc).scm >$@

html-local: html-stamp $(srcdir)/$(doc).scm $(depfiles)
html-stamp:
	GUILE_AUTO_COMPILE=0								\
	$(top_builddir)/dev-environ $(srcdir)/make-html.scm $(srcdir)/$(doc).scm
	touch $@
