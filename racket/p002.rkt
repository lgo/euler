#lang racket
;;;;;;;;;;;;;;;;;
;;shorter solution, but not as efficient - using libraries
(require math/number-theory)
;;iter: -> Int
;;Sums all fibonacci numbers smaller than n that are even
(define (iter n)
  (define (iter x sum)
    (define f (fibonacci x))
    (cond [(> f n) sum]
          [(even? f) (iter (add1 x) (+ sum f))]
          [else (iter (add1 x) sum)]))
  (iter 0 0))
(iter 400000)

;;;;;;;;;;;;;;;;;
;;original solution - more efficient/fast
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