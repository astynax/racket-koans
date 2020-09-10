#lang racket ; It's not racket/base this time. Why?

(require rackunit)


;; Racket has mutable and immutable strings.
(check-equal? (immutable? "Giraffe") #t)
(check-equal? (immutable? (make-string 10 #\a)) #f)
(check-equal? (immutable? (string #\a #\b #\c)) #f)
(check-equal? (immutable? (string-copy (string))) #f)

(define dotphabet
  (build-string 26 (lambda (i)
    (if (even? i)
      (integer->char (+ 65 i))
      #\.))))

;; When test results guide you, these are gimmes.
(check-equal? (string-ref dotphabet 8) #\I)
(check-equal? (string-ref dotphabet 19) #\.)
(check-eqv? (string-length dotphabet) 26)
(check-equal? (string-downcase dotphabet) "a.c.e.g.i.k.m.o.q.s.u.w.y.")

;; Without mutating `dotphabet`, produce the string shown
;; using a single expression.
(check-equal?
 (string (char-downcase (string-ref dotphabet 20))
         #\#
         (char-downcase (string-ref dotphabet 18))
         #\#
         (char-downcase (string-ref dotphabet 16))) "u#s#q")
