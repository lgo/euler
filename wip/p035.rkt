#lang racket

(define numbers (rest (rest (build-list 1000000 (lambda (x) x)))))

(define (sieve lst)
  (define (sieve lst acc)
    (cond [(empty? lst) acc]
          [else
           (sieve (filter (lambda (f) (not (= (remainder f (first lst)) 0))) lst)
                  (cons (first lst) acc))]))
  (sieve lst empty))

(define primes (reverse (sieve numbers)))

(define (prime x)
  (list-ref primes (sub1 x)))

(prime 10001)