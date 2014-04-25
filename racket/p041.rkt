#lang racket
(require (prefix-in nt: math/number-theory))
(define (perm->num lst) (foldr (lambda (x r) (+ x (* 10 r))) 0 lst))
(define pan-primes (filter nt:prime? (foldr append empty (build-list 8 (lambda (x) (map perm->num (permutations (range 1 (+ x 2 1)))))))))
(apply max pan-primes)