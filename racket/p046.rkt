#lang racket
(require math/number-theory)

(define odd-composites (filter (compose not prime?) (filter odd? (range 1 10000))))

(define (goldbach n)
  (define (testing x)
    (define const (* 2 (expt x 2)))
    (cond [(> const n) #f]
          [(prime? (- n const)) #t]
          [else (testing (add1 x))]))
  (testing 1))

(filter (compose not goldbach) odd-composites)