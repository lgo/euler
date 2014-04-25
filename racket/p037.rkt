#lang racket

(define numbers 
  ;(filter (lambda (x) (define y (modulo x 10))(or (= 2 y)(= 3 y)(= 5 y)(= 7 y)))
                                     
                                     (rest (rest (build-list 800000 (lambda (x) x)))))
  ;)

(define (sieve lst)
  (define (sieve lst acc)
    (cond [(empty? lst) acc]
          [else
           (sieve (filter (lambda (f) (not (= (remainder f (first lst)) 0))) lst)
                  (cons (first lst) acc))]))
  (sieve lst empty))

(define primes (reverse (sieve numbers)))

;(define primes '(3 7 37 97 797 379 3797))

(define (prime x)
  (list-ref primes (sub1 x)))

(define (list->num lst)
  (string->number (list->string lst)))

(define (trunc? n)
  (define digs (string->list (number->string n)))
  (define (gets n x acc)
    (cond [(= n 0) acc]
          [else (gets (sub1 n) x (cons (x n) acc))]))
  (define right-trun (map list->num (gets (sub1 (length digs)) (lambda (y) (take digs y)) empty)))
  (define left-trun (drop (map list->num (gets (sub1 (length digs)) (lambda (y) (drop digs y)) empty)) 0))
  (and (andmap (lambda (x) (member x primes)) right-trun)
       (andmap (lambda (y) (member y primes)) left-trun)))

(define trun-primes (drop (filter (lambda (x) (trunc? x)) primes) 4))