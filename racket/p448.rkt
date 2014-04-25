#lang racket
(require math/number-theory)
(define (a n)
  (/ (foldr + 0 (map (lambda (x) (lcm n x)) (range 1 (add1 n)))) n))
(define (s n)
  (foldr + 0 (map (lambda (x) (a x)) (range 1 (add1 n)))))
(define n (modulo (s 99999999019) 999999017))