#lang racket

;;NO SOLUTION (in progress, extremely bruteforce)
(define (check-triplets)
  (define (triples a b c)
    (cond [(and (= 1000 (+ a b c)) (= (sqr c) (+ (sqr b) (sqr a)))) (* a b c)]
          [(< c b) (triples a b (add1 c))]
          [(< b a) (triples a (add1 b) c)]
          [(< 1000 c) (triples a (add1 b) 1)]
          [(< 1000 b) (triples (add1 a) 1 c)]
          [else (triples a b (add1 c))]))
  (triples 1 1 1))
