#lang racket

(define fibtable empty)

;;digits: Int -> (listof Int)
;;Returns a list of the digits
(define (digits n . args)
  (let ((b (if (null? args) 10 (car args))))
    (let loop ((n n) (d '()))
      (if (zero? n) d
          (loop (quotient n b)
                (cons (modulo n b) d))))))

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
          [(= 1000 (length (digits (second (first fibtable))))) (void)]
          [(> (second (first fibtable)) n) (void (set! fibtable (rest fibtable)))]
          [else (void (fib a) (gen n (add1 a)))]))
  (gen n 1))

(define (solve)
  (generate (expt 10 999))
  (first (first fibtable)))

(solve)