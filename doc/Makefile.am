
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

# we use wildcard - non-POSIX variable name
# AUTOMAKE_OPTIONS = gnu

doc = guile-library
include docs.mk

info_TEXINFOS = guile-library.texi

guile_library_TEXINFOS =	\
	NamingConventions.texi	\
	fdl.texi

www: html guile-library.pdf clean-www
	find www -name 'index.scm' -print \
	  | while read f; do \
	      GUILE_AUTO_COMPILE=0 \
              $(GUILE) -l "$$f" -c '(make-index)' \
	        > `echo $$f | sed -e s,\.scm,\.html,`; \
	    done
	cp -a html www/doc/ref
	cp guile-library.pdf www/doc/

www-commit: www
	( export CVSDIR=:ext:cvs.sv.nongnu.org:/web/guile-lib; cd www; cvs -d $$CVSDIR import -m 'make www in guile-lib/docs' guile-lib gnu $$(date "+D%Y%m%d%H%M%S"))

clean-www:
	find www -name 'index.html' -print \
	  | while read f; do rm -f "$$f"; done
	rm -rf www/doc/ref
	rm -f www/doc/guile-library.pdf

clean-local: clean-docs clean-www
