#lang racket
(require math/number-theory)
(define primes (filter prime? (range 1 1000000)))
(define (consec lst high cur highn n)
  (cond [(empty? (rest lst)) (if (> n highn) cur high)]
        [(= (first lst) (- (second lst) 2)) (consec (rest lst) (if (> n highn) cur high) (+ cur (second lst)) (max n highn) (add1 n))]
        [else (consec (rest lst) high (first lst) highn 1)]))
(consec primes 0 2 0 1)
  