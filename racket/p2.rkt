#lang racket

(define fibtable empty)

;;fib: Integer -> Integer
;;Generates the n-th fibonacci number, caching locally
(define (fib n)
  (define result (assoc n fibtable))
  (cond [result => second]
        [else (define fibnumber (cond [(= n 1) 1]
                    [(= n 2) 1]
                    [else (+ (fib (- n 1))
                             (fib (- n 2)))]))
              (set! fibtable (cons (list n fibnumber) fibtable))
              fibnumber]))

;;generate: Integer -> VOID
;;Generates all fibonacci numbers smaller than n
(define (generate n)
  (define (gen n a)
    (cond [(empty? fibtable)(void (fib 1) (gen n 2))]
          [(> (second (first fibtable)) n) (void (set! fibtable (rest fibtable)))]
          [else (void (fib a) (gen n (add1 a)))]))
  (gen n 1))


(generate 4000000)
(foldr + 0
       (map (lambda (item)
              (cond [(even? (second item)) (second item)]
                    [else 0]))
            fibtable))