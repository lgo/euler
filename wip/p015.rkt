#lang racket
;; NOT COMPLETE

(define (paths n)
  (define lst (rest (build-list n (lambda (x) x))))
  (cond
    [(= n 0) 0]
    [(= n 1) 2]
    [(= n 2) 6]
    [else
     (foldr (lambda (x)
              (
               (paths x)
               ))
            0
            lst)
