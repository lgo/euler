#lang racket
;;;;;;;;;;;;;;;;;;;
;; shorter solution
(require math/number-theory)
(last (prime-divisors 600851475143))

;;;;;;;;;;;;;;;;;;;
;; original solution

;;factors: Int -> (listof (list Int Int))
;;Returns a list of factor pairs, where the first is increasing and the second is decreasing
(define (factors num)
  ;;factorz: Int (listof (list Int Int))
  ;;Accumulates the factors in acc as ther iterator grows to the largest possible factor
  (define (factors iter acc)
    (cond [(< (sqrt num) iter) acc]
          [(exact-nonnegative-integer? (/ num iter)) (factors (add1 iter) (cons (list iter (/ num iter)) acc))]
          [else (factors (add1 iter) acc)]))
  (factors 2 empty))

;;is-prime: Int -> Boolean
;;Determines whether or not p is prime
(define (is-prime p)
  ;;is-prime-acc: Int -> Boolean
  ;;Accumulates the currently tested factor iter for the prime
  (define (is-prime-acc iter)
    (cond [(< (sqrt p) iter) true]
          [(exact-nonnegative-integer? (/ p iter)) false]
          [else (is-prime-acc (add1 iter))]))
  (is-prime-acc 2))

;;largest-prime-factor: Int -> Int
;;Determines the largest prime factor of n
(define (largest-prime-factor n)
  (define factor (factors n))
  (define result (foldr (lambda (x r)
                          (cond [(and (false? r) (is-prime (second x))) (second x)]
                                [(false? r) false]
                                [else r]))
                        false
                        (factors n)))
  (cond [(false? result)
         (foldl (lambda (x r)
                  (cond [(and (false? r) (is-prime (first x))) (first x)]
                        [(false? r) false]
                        [else r]))
                false
                (factors n))]
        [else result]))

(largest-prime-factor 600851475143)