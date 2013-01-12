;;; ----------------------------------------------------------------------
;;;    unit test
;;;    Copyright (C) 2004 Richard Todd
;;;
;;;    This program is free software; you can redistribute it and/or modify
;;;    it under the terms of the GNU General Public License as published by
;;;    the Free Software Foundation; either version 2 of the License, or
;;;    (at your option) any later version.
;;;
;;;    This program is distributed in the hope that it will be useful,
;;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;    GNU General Public License for more details.
;;;
;;;    You should have received a copy of the GNU General Public License
;;;    along with this program; if not, write to the Free Software
;;;    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;;; ----------------------------------------------------------------------

(use-modules (md5)
             (unit-test)
             (oop goops))

(define-class <test-md5> (<test-case>)
  (test-string #:getter test-string 
               #:init-value "The quick brown fox.")
  ;; this answer generated with /usr/bin/md5 for comparison purposes...
  (test-answer #:getter test-answer 
               #:init-value  "2e87284d245c2aae1c74fa4c50a74c77")

  ;; These digests from RFC 1321 test suite.
  (test-digests #:getter test-digests
                #:init-value
   '(("" . "d41d8cd98f00b204e9800998ecf8427e")
     ("a" . "0cc175b9c0f1b6a831c399e269772661")
     ("abc" . "900150983cd24fb0d6963f7d28e17f72")
     ("message digest" . "f96b697d7cb7938d525a2f31aaf161d0")
     ("abcdefghijklmnopqrstuvwxyz" . "c3fcd3d76192e4007dfb496cca67e13b")
     ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" . "d174ab98d277d9f5a5611c2c9f419d9f")
     ("12345678901234567890123456789012345678901234567890123456789012345678901234567890" . "57edf4a22be3c955ac49da2e2107b67a"))))

(define-method (test-default-port (self <test-md5>))
  (assert-equal (test-answer self) 
                (with-input-from-string (test-string self) 
                  (lambda () (md5)))))

(define-method (test-given-port (self <test-md5>))
  (assert-equal (test-answer self) 
                (md5 (open-input-string (test-string self)))))

(define-method (test-rfc (self <test-md5>))
  (for-each (lambda (pair)
              (assert-equal (cdr pair)
                            (md5 (open-input-string (car pair)))))
            (test-digests self)))

(exit-with-summary (run-all-defined-test-cases))

;;; arch-tag: 0D9E8711-F9E7-11D8-AE52-000A95CD5044


