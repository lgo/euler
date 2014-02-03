#lang racket

;;is-palindrome: Int -> Boolean
;;Determines if n is a palindrome (symmetrical number)
(define (is-palindrome n)
  (define (palindrome deacc acc)
    (cond [(zero? deacc) (= n acc)]
          [else (palindrome (floor (/ deacc 10))
                            (+ (* acc 10) (- deacc (* (floor (/ deacc 10)) 10))))]))
  (palindrome n 0))

;;trip-product: (listof Int)
;;Returns all triple products in ascending order
(define (trip-product)
  (define (deacc iter1 iter2 acc)
    (cond [(zero? iter1) (deacc 999 (sub1 iter2) acc)]
          [(zero? iter2) acc]
          [else (deacc (sub1 iter1) iter2 (cons (* iter1 iter2) acc))]))
  (remove-duplicates (sort (deacc 999 999 empty) <)))

(foldr (lambda (x r)
         (cond [(and (false? r) (is-palindrome x)) x]
               [(false? r) false]
               [else r]))
         false
         (trip-product))