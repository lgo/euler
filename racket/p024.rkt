#lang racket
(define (perm->num lst) (foldr (lambda (x r) (+ x (* 10 r))) 0 lst))
(define lst (sort (map perm->num (permutations (range 0 10))) <))
(list-ref lst (sub 1 1000000))