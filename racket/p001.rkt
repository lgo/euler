#lang racket
;;mod-3-or-5: Int -> Bool
;;Determines if n is a multiple of 5 or 3
(define (mod-3-or-5 n)
  (or (= 0 (modulo n 3))
      (= 0 (modulo n 5))))

;;sum
(foldr + 0
       (filter mod-3-or-5
               (range 1 1000)))