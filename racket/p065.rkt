#lang racket

;same generator as fib!

(define table empty)

(define (coeff n)
  (cond [(= (modulo n 3) 0)
         (* 2 (quotient n 3))]
        [else 1]))

(define (seq n)
  (define result (assoc n table))
  (cond [result => second]
        [else (define number
                (cond 
                  [(= n 0) 0]
                  [(= n 1) 2]
                  [(= n 2) 3]
                  [else (+ 
                         (* (coeff n)
                            (seq (- n 1)))
                         (seq (- n 2)))]))
              (set! table (cons (list n number) table))
              number]))
(define num (seq 100))
(define sum (foldr + 0 (map (lambda (x) (string->number (list->string x))) (map list (string->list (number->string num))))))

;nice quick O(2^n) time! :D
(define (sequence n)
  (cond [(= n 1) 2]
        [(= n 2) 3]
        [else (+ (* (if (= (modulo n 3) 0)
                        (* 2 (quotient n 3))
                        1)
                    (seq (- n 1)))
                 (seq (- n 2)))]))