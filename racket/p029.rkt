#lang racket

;;lazy, but mathematically we will have a^b == (a^2)^ (b / 2), e.g. 2^2 = 4^1...
;; so for any perfect square number, we have the only distinct digit we have is the 100th one...
;; so we only have perfect square numbers where we don't have new distinct digits!

(define (remove-duplicates lst)
  
(define (remove-duplicates lst acc)
  (cond [(empty? (rest lst)) (cons (first lst) acc)]
        [(= (first lst) (second lst)) (remove-duplicates (rest lst) acc)]
        [else (remove-duplicates (rest lst) (cons (first lst) acc))]))
  (remove-duplicates lst empty))

(define lst (remove-duplicates (sort (foldr append empty (build-list 99
                                                                     (lambda (x)
                                                                       (build-list 99 (lambda (y)
                                                                                        (expt (+ x 2) (+ y 2))))))) >)))
(length lst)