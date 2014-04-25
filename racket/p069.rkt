#lang racket
(require math/number-theory)
(define mil (range 1 1000001))
(define n-div-totients (map (lambda (x y) (/ x y))
                       mil
                       (build-list 1000000 (lambda (x) (totient (add1 x))))))
(foldr (lambda (x y r)
         (cond [(> y (second r)) (list x y)]
               [else r]))
       '(0 0)
       mil
       n-div-totients)