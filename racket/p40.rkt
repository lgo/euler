#lang racket

;;num->digs: Int -> (listof Int)
;;Returns the list of digits representing n
(define (num->digs n)
  (define (num->digs n acc)
    (cond [(= n 0) acc]
          [else (define down (floor (/ n 10)))
                (num->digs down (cons (- n (* 10 down)) acc))]))
  (num->digs n empty))
  
;;sequence-digit: Int -> Int
;;Returns the n-th digit of the sequence for the problem
(define (sequence-digit n)
  (define (digit curr num n lst)
    (cond [(empty? lst) (digit curr (add1 num) n (num->digs num))]
          [(= curr n) (first lst)]
          [else (digit (add1 curr) num n (rest lst))]))
  (digit 0 1 n (num->digs 1)))

;;quick function to shorthand the product's sequence points
(define (rec start)
  (define (rec n acc)
    (if (= n 1) (* acc (sequence-digit 1))
        (rec (/ n 10) (* acc (sequence-digit n)))))
  (rec start 1))