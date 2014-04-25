#lang racket
(define (diag size)
  (define (cur n len side dist sum)
    (cond
      [(> len size) sum]
      [(= side 5) (cur n (+ len 2) 1 1 sum)]
      [(= dist (- len 1)) (cur (add1 n) len (add1 side) 1 (+ sum n))]
      [else (cur (add1 n) len side (add1 dist) sum)]))
  (+ (cur 10 5 1 1 0) 25)) ;start on the 10, consistent afterwords
(diag 1001)