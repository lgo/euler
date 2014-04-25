#lang racket
(require math/number-theory)

(define pan (string->list (number->string 123456789)))

(define (pandigital-end n)
  (define str (string->list (number->string n)))
  (cond [(> 9 (length str)) #f]
        [else 
         ;(define front (sort (take str 9) char<?))
         (define end (sort (take-right str 9) char<?))
          (equal? pan end)
          ]))

(define (pandigital-front n)
  (define str (string->list (number->string n)))
  (cond [(> 9 (length str)) #f]
        [else 
         (define front (sort (take str 9) char<?))
         ;(define end (sort (take-right str 9) char<?))
         (equal? pan front)
          ]))
(define (pandigital-ends n)
  (define str (string->list (number->string n)))
  (cond [(> 9 (length str)) #f]
        [else 
         (define front (sort (take str 9) char<?))
         (define end (sort (take-right str 9) char<?))
         (and (equal? pan front) (equal? pan end))
          ]))


(define (best)
  (define (best n)
    (cond [(pandigital-end (fibonacci n)) n]
          [else (best (add1 n))]))
  (best 1))

(define lst  '(2749 4589 7102 7727 8198 9383 12633 15708 19014 21206 21303 21434 21566 22706 22890 25790 28244 29877 32174 32717 34433 34883 37965 44691 47422 48635 54473 60438 60536 63902 68340 72424 73147 75873))

(define (g i)
  (pandigital-ends (fibonacci (list-ref lst i))))

;(define n 11)

;(define lst 
;  (map (lambda (x) (list x (fibonacci x))) (range (* n 10000) (* (+ n 1) 10000))))
;(define front (filter (lambda (x) (pandigital-front (second x))) lst))
;(define ends (filter (lambda (x) (pandigital-end (second x))) front))
;(length ends)