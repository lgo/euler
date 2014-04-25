#lang racket

;;digs-sum: Int -> Int
;;Returns the sum of each digit in n
(define (digs-sum n)
  (define (digs-sum n acc)
    (cond [(= n 0) acc]
          [else (digs-sum (floor (/ n 10)) (+ acc (- n (* 10 (floor (/ n 10))))))]))
  (digs-sum n 0))

;;divisors: Int -> (listof (list Int Int)
;;Returns all of the divisors of n in a incr first, decr second list
(define (divisors n)
  (define sq (sqrt n))
  (define (divisors iter acc)
    (cond [(> iter sq) acc]
          [else (define qout (/ n iter))
                (cond [(exact-nonnegative-integer? qout) (divisors (add1 iter) (cons (list iter qout) acc))]
                      [else (divisors (add1 iter) acc)])]))
  (divisors 2 empty))

;;d: Int -> Int
;;Function - sum of divisors of n
(define (d n)
  (add1 (foldr (lambda (x r)
           (+ (first x)
              (second x)
              r))
         0
         (divisors n))))

(foldr + 0
       (filter
        (lambda (x)
          (define da (d x))
          (and (not (= da x))
               (= x (d da))))
        (rest (build-list 10000 (lambda (x) x)))))