#lang racket
(apply max (map (lambda (x) (foldr + 0
                        (map (lambda (y) (string->number (list->string (list y))))
                             x)))
     (map string->list (map number->string (foldr append empty (build-list 100 (lambda (x) 
                                                              (build-list 100
                                                                          (lambda (y)
                                                                            (expt x y))))))))))