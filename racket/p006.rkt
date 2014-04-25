#lang racket
(define r (range 1 101))
(- (sqr (foldr + 0
       r))
   (foldr + 0
          (map sqr r)))