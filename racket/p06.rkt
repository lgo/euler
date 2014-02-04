#lang racket

(- (sqr (foldr + 0
       (build-list 101 (lambda (x) x))))
   (foldr + 0
          (map sqr (build-list 101 (lambda (x) x)))))