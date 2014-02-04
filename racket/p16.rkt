#lang racket

;;digs-sum: Int -> Int
;;Returns the sum of each digit in n
(define (digs-sum n)
  (define (digs-sum n acc)
    (cond [(= n 0) acc]
          [else (digs-sum (floor (/ n 10)) (+ acc (- n (* 10 (floor (/ n 10))))))]))
  (digs-sum n 0))

(digs-sum (expt 2 1000))