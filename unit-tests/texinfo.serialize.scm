;; guile-lib
;; Copyright (C) 2007 Andy Wingo <wingo at pobox dot com>

;; This program is free software; you can redistribute it and/or    
;; modify it under the terms of the GNU General Public License as   
;; published by the Free Software Foundation; either version 2 of   
;; the License, or (at your option) any later version.              
;;                                                                  
;; This program is distributed in the hope that it will be useful,  
;; but WITHOUT ANY WARRANTY; without even the implied warranty of   
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    
;; GNU General Public License for more details.                     
;;                                                                  
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, contact:
;;
;; Free Software Foundation           Voice:  +1-617-542-5942
;; 59 Temple Place - Suite 330        Fax:    +1-617-542-2652
;; Boston, MA  02111-1307,  USA       gnu@gnu.org

;;; Commentary:
;;
;; Unit tests for (texinfo serialize).
;;
;;; Code:

(use-modules (oop goops)
             (unit-test)
             (texinfo serialize))

(define-class <test-texinfo-serialize> (<test-case>))

(define-method (test-serialize (self <test-texinfo-serialize>))
  (define (assert-serialize stexi str)
    (assert-equal str (stexi->texi stexi)))

  (assert-serialize '(para)
                    "

")

  (assert-serialize '(para "foo")
                    "foo

")

  (assert-serialize '(var "foo")
                    "@var{foo}")
                    

  ;; i don't remember why braces exists, but as long as it does, a test
  ;; is in order
  (assert-serialize '(*braces* "foo")
                    "@{foo@}")

  (assert-serialize '(value (% (key "foo")))
                    "@value{foo}")

  (assert-serialize '(ref (% (node "foo")))
                    "@ref{foo}")
  (assert-serialize '(ref (% (node "foo") (name "bar")))
                    "@ref{foo,bar}")
  (assert-serialize '(ref (% (node "foo") (name "bar")
                             (section "qux") (info-file "xyzzy")
                             (manual "zarg")))
                    "@ref{foo,bar,qux,xyzzy,zarg}")
  (assert-serialize '(ref (% (section "qux") (info-file "xyzzy")
                             (node "foo") (name "bar")
                             (manual "zarg")))
                    "@ref{foo,bar,qux,xyzzy,zarg}")
  (assert-serialize '(ref (% (node "foo")
                             (manual "zarg")))
                    "@ref{foo,,,,zarg}")

  (assert-serialize '(dots) "@dots{}")

  (assert-serialize '(node (% (name "foo")))
                    "@node foo
")

  (assert-serialize '(node (% (name "foo bar")))
                    "@node foo bar
")
  (assert-serialize '(node (% (name "foo bar") (next "baz")))
                    "@node foo bar, baz
")

  (assert-serialize '(title "Foo")
                    "@title Foo
")
  (assert-serialize '(title "Foo is a " (var "bar"))
                    "@title Foo is a @var{bar}
")

  (assert-serialize '(title "Foo is a " (var "bar") " baz")
                    "@title Foo is a @var{bar} baz
")

  (assert-serialize '(cindex (% (entry "Bar baz, foo")))
                    "@cindex Bar baz, foo
")

  ;; there is a space after @iftex, doesn't matter tho
  (assert-serialize '(iftex
                      (para "This is only for tex.")
                      (para "Note. Foo."))
                    "@iftex 
This is only for tex.

Note.  Foo.

@end iftex

")

  (assert-serialize '(defun (% (name "frob"))
                       (para "foo?"))
                    "@defun frob
foo?

@end defun

")

  (assert-serialize '(defun (% (name "frob") (arguments "bar"))
                       (para "foo?"))
                    "@defun frob bar
foo?

@end defun

")

  (assert-serialize '(defun (% (name "frob") (arguments "bar" " " "baz"))
                       (para "foo?"))
                    "@defun frob bar baz
foo?

@end defun

")

  (assert-serialize '(defun (% (name "frob") (arguments (var "bar")))
                       (para "foo?"))
                    "@defun frob @var{bar}
foo?

@end defun

")

  (assert-serialize '(defunx (% (name "frob") (arguments (var "bar"))))
                    "@defunx frob @var{bar}
")

  (assert-serialize '(table (% (formatter (var)))
                            (entry (% (heading "Foo bar " (code "baz")))
                                   (para "Frobate")
                                   (para "zzzzz")))
                    "@table @var
@item Foo bar @code{baz}
Frobate

zzzzz

@end table

")

  (assert-serialize '(verbatim "foo")
                    "@verbatim 
foo
@end verbatim

")

  (assert-serialize '(deffnx (% (name "foo") (category "bar")))
                    "@deffnx bar foo
")

  (assert-serialize '(deffnx (% (name "foo") (category "bar") (arguments "x" " " "y")))
                    "@deffnx bar foo x y
")

  (assert-serialize '(deffnx (% (name "foo") (category "bar") (arguments "(" "x" " " (code "int") ")")))
                    "@deffnx bar foo (x @code{int})
")

  )

(exit-with-summary (run-all-defined-test-cases))
