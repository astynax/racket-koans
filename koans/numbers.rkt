#lang racket/base

(require rackunit)

;; Arithmetic procedures resemble prefix notation.
(check-equal? (+ 1 0) 1)
(check-equal? (* 1 0) 0)
(check-equal? (/ 4 2) 2)
(check-equal? (- 1 1) 0)
(check-equal? (+ (+ 2 (* 3 3)) (+ 76 11)) 98)

;; Number types are carefully categorized in Racket. We've used equal? tests
;; via rackunit for everything leading up to now, but that's not the whole
;; story. Racket provides several procedures to test for equality. It will
;; take practice to understand the nuances, but just know that in Lisp-family
;; languages you must think carefully about the context in which you consider
;; two values indistinguishable, lest you get unexpected results.
;;
;; Racket has exact and inexact numbers and your checks will indicate when you
;; care about the difference.
;;
;; See https://docs.racket-lang.org/reference/numbers.html
(check-equal?
    (= 3 3.0)
    #t
    "3 and 3.0 may appear to be equal to some...")
(check-equal?
    (eqv? 3 3.0)
    #f
    "...but they are not equivalent.")


;; More equality predicates will also start appearing in tests.
;; See https://docs.racket-lang.org/rackunit/api.html#%28part._.Checks%29
(check-not-eqv? 3 3.0)

;; Using only 'exact?' and 'inexact?', categorize these numbers.
(define (replaceme x) #f)
(check-pred inexact? #i0)
(check-pred exact? -1)
(check-pred exact? 1)
(check-pred inexact? #i#b100)
(check-pred exact? 999999999999999)
(check-pred exact? 2/3)
(check-pred exact? #e2/3)
(check-pred inexact? #i0)
(check-pred exact? 1/2+8/9i)
(check-pred inexact? 0.1)
(check-pred inexact? (* 34 0.1))
(check-pred exact? #e.23e+42)
(check-pred inexact? -inf.0)
(check-pred inexact? +nan.0)
