#lang racket
(require math/number-theory)
  (define (continue n val)
     (cond [(> (length (divisors val)) 500) val]
              [else (continue (add1 n) (+ val n))]))
  (continue 1 0)
