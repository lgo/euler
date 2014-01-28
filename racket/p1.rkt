#lang racket
(define n 1000)
(foldr + 0
       (filter (lambda (i)
          (or (= 0 (modulo i 5))
              (= 0 (modulo i 3))))
        (build-list n (lambda (i) i))))