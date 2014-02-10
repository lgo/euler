#lang racket

;;UNSOLVED - not reasonable runtime

;;digit-sum: Int -> Int
;;Returns the sum of the digits in n
(define (digit-sum n)
  (define (num->digs n acc)
    (cond [(= n 0) acc]
          [else (define down (floor (/ n 10)))
                (num->digs down (+ (- n (* 10 down)) acc))]))
  (num->digs n 0))

(define (iterate a b mx)
  (cond [(= a b 100) mx]
        [else (define pows (digit-sum (expt a b)))
              (iterate (+ a (if (= b 99) 1 0)) (modulo (add1 b) 100) (if (> pows mx) pows mx))]))