#lang racket/base

(require rackunit)

;;; See https://docs.racket-lang.org/guide/characters.html

(check-equal?
  (char->integer #\u0110)
  272)

(check-equal?
  (integer->char 72)
  #\H)

;; Classify these characters: https://docs.racket-lang.org/reference/characters.html#%28def._%28%28quote._~23~25kernel%29._char-alphabetic~3f%29%29
;; Challenge: Use each character classification predicate once.
(check-pred char-punctuation? #\,)
(check-pred char-alphabetic? #\a)
(check-pred char-upper-case? #\u03A3)
(check-pred char-blank? #\tab)
(check-pred char-iso-control? #\0002)
(check-pred char-upper-case? #\J)
(check-pred char-whitespace? #\newline)
(check-pred char-lower-case? #\z)
(check-pred char-numeric? #\6)
(check-pred char-graphic? #\u1FA8)
(check-pred char-symbolic? #\u002B)
