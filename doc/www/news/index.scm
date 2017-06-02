(define page
  '((h2 "news")

    (news
     (@ (date "2 June 2017")
        (title "Guile-Lib 0.2.5.1 available"))
     (code "Guile-Lib") " 0.2.5.1 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")

    (news
     (@ (date "17 January 2017")
        (title "guile-lib 0.2.5 available"))
     (code "guile-lib") " 0.2.5 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")

    (news
     (@ (date "14 November 2016")
        (title "guile-lib 0.2.4 available"))
     (code "guile-lib") " 0.2.4 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")

    (news
     (@ (date "19 September 2016")
        (title "guile-lib 0.2.3 available"))
     (code "guile-lib") " 0.2.3 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")

    (news
     (@ (date "31 January 2013")
        (title "guile-lib 0.2.2 available"))
     (code "guile-lib") " 0.2.2 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")

    (news
     (@ (date "3 April 2011")
        (title "guile-lib 0.2.1 available"))
     (code "guile-lib") " 0.2.1 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")
    
    (news
     (@ (date "26 March 2011")
        (title "guile-lib 0.2.0 available"))
     (code "guile-lib") " 0.2.0 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")
    
    (news
     (@ (date "29 August 2010")
        (title "guile-lib 0.1.9 available"))
     (code "guile-lib") " 0.1.9 has been released. Check the "
     (a (@ (href "http://download.savannah.gnu.org/releases/guile-lib/NEWS")) "NEWS")
     " for details.")
    
    (news
     (@ (date "26 January 2009")
        (title "guile-lib moved to savannah, git"))
     "We've moved to "
     (a (@ (href "http://savannah.nongnu.org/p/guile-lib/")) "Savannah")
     ", hosted by the Free Software Foundation. Also our source code is "
     "now managed in " (a (@ (href "http://git.sv.nongnu.org/gitweb/?p=guile-lib.git")) "git")
     ". We hope these changes will make it easier for Guile hackers to contribute."
     " A new release should be coming soon.")
    
    (news
     (@ (date "24 September 2007")
        (title "guile-lib 0.1.6 available"))
     (code "guile-lib") " 0.1.6 has been released. Check the "
     (a (@ (href "http://download.gna.org/guile-lib/NEWS")) "NEWS")
     " for details.")
    
    (news
     (@ (date "9 August 2007")
        (title "guile-lib 0.1.5 available"))
     (code "guile-lib") " 0.1.5 has been released featuring a "
     (rlink "doc/ref/container.async-queue/" "new module")
     " plus a few bugfixes.")
    
    (news
     (@ (date "20 July 2007")
        (title "guile-lib 0.1.4 available"))
     (code "guile-lib") " 0.1.4 has been released, featuring two "
     (rlink "doc/ref/match-bind/" "new") " "
     (rlink "doc/ref/scheme.kwargs/" "modules") " "
     " and other bugfixes and improvements.")
    
    ))


(load "../template.scm")

(define (news tag args . body)
  `(div (h4 ,@(assq-ref (cdr args) 'date) ": "
            ,@(assq-ref (cdr args) 'title))
        (p ,@body)))

(define (make-index)
  (output-html page "guile-lib: news" "news" "../"
               #:transform-rules `((news . ,news))))
