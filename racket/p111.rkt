#lang racket
(require math/number-theory)
(define (sift char num)
  (define str (string->list (number->string num)))
  (define count (sub1 (length str)))
  (cond [(char=? char #\0) (set! count (sub1 count))])
  (cond [(not (member char str)) #f]
        [else 
         (= (length (member char (reverse (member char (sort str char<?))))) count)]))
(define r (range 1000 10000))
(define runs (foldr append empty (map (lambda (x) (filter (lambda (y) (sift x y)) r)) '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))))
(define runs-primes (filter prime? runs))
(foldr + 0 runs-primes)