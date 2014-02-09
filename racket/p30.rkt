#lang racket

;;INCOMPLETE SOLUTION (far too slow)

;;fifthpowersum: Int Int Int Int -> Int
;;Returns the sum of the fifth power of a .. d
(define (fifthpowersum a b c d)
  (define (pows n)
    (expt n 5))
  (+ (pows a) (pows b) (pows c) (pows d)))

;;dig->int: (listof Int) -> Int
;;Returns the integer represented by the lst of digits
(define (dig->int lst)
  (foldl (lambda (x r)
           (+ x (* 10 r)))
         0
         lst))

(define (iterate a b c d acc)
  (define num (dig->int (list a b c d)))
  (define additional (cond [(= num 1) 0]
                           [(= (fifthpowersum a b c d) num) num]
                           [else 0]))
  (define (inc n p) (+ n (floor (/ p 10))))
  (cond [(= 9 a b c d) (+ acc additional)]
        [else (iterate (inc a b)
                       (inc b c)
                       (inc c d)
                       (modulo (add1 d) 10)
                       (+ acc additional))]))