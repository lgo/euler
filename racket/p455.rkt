#lang racket
(define ten9 (expt 10 9))
(define (f n)
  (define (brut x)
    (define end-digits (modulo (expt n x) 1000000000))
    (cond 
      [(= x ten9) 0]
      [(= end-digits x) x]
      [else (brut (add1 x))]))
  (brut 1))