#lang racket

;;digs-sum: Int -> Int
;;Returns the sum of each digit in n
(define (digs-sum n)
  (define (digs-sum n acc)
    (cond [(= n 0) acc]
          [else (digs-sum (floor (/ n 10)) (+ acc (- n (* 10 (floor (/ n 10))))))]))
  (digs-sum n 0))

;;factorial: Int -> Int
;;Returns the factorial of n
(define (factorial n)
  (define (factorial n acc)
    (cond [(= n 0) acc]
          [else (factorial (sub1 n) (* acc n))]))
  (factorial n 1))

(digs-sum (factorial 100))