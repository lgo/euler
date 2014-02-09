#lang racket

(define period (expt 10 10))

;;round: Int Int -> Int
;;Complete a single round of a^a summing, in the accumulator b
(define (round a b)
  (cond [(= a 1001) b]
        [else (round (add1 a) (modulo (+ b (modulo (expt a a) period)) period))]))