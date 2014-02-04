;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname p10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;***
;; Sieve of Eratethomes
;;***
;;never generated in good time :c
;;NO SOLUTION
(define (sieve acc f list)
  (cond [(empty? list) acc]
        [(= (modulo (first list) f) 0) (sieve acc f (rest list))]
        [else (sieve (cons (first list) acc) f (rest list))]))

(define (soe n)
  (reverse (soe/r empty (rest (rest (build-list (add1 n) (lambda (x) x)))))))
                
(define (soe/r acc list)
  (cond [(empty? list) acc]
        [else (soe/r (cons (first list) acc) (reverse (sieve empty (first list) (rest list))))]))