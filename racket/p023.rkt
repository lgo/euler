#lang racket
(require math/number-theory)
(define abun (filter (lambda (x) (> (- (foldr + 0 (divisors x)) x 1) x)) (range 1 28123)))
(define (mutate lst)
(define (mutate lst acc)
  (cond [(empty? lst) acc]
        [else (mutate (rest lst) (append acc (map (lambda (x) (+ (first lst) x)) (rest lst))))]))
(mutate lst empty))
(define nums (mutate abun))