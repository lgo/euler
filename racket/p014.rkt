#lang racket

;;max-al: (listof (list X Int)) -> (list X Int)
;;Returns the maximum valued key:value pair
(define (max-al lst)
  (foldr (lambda (x r)
           (cond [(or (false? r) (> (second x) (second r))) x]
                 [else r]))
         false
         lst))

;;collatz: Int Int Int -> (list Int Int)
;;Generates the length of a given collatz sequence, returning the initial number and the length
(define (collatz n)
  (define (collatz n start count)
    (cond [(= n 1) (list start count)]
          [(even? n) (collatz (/ n 2) start (add1 count))]
          [else (collatz (add1 (* 3 n)) start (add1 count))]))
  (collatz n n 1))

(define length 1000000)
;(max-al (map (lambda (x) (collatz x))
;             (rest (build-list length (lambda (x) x)))))