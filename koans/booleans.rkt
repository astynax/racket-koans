#lang racket/base

(require rackunit)

;; Racket uses #t and #f to represent boolean values.
(check-equal? (boolean? "t") #f)
(check-equal? (boolean? "f") #f)

;; Case does not matter for boolean constants
(check-equal? (boolean? "t") #f)
(check-equal? (boolean? "f") #F)
(check-equal? (boolean? "T") #f)
(check-equal? (boolean? "F") #F)

;; Test expressions evaluate to a value based ultimately on booleans.
(check-equal? (if #t "when true" "otherwise") "when true")

;; When testing, anything other than #f counts as #t
(check-equal? (if "false" "yay" "nay") "yay")
