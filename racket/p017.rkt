#lang racket

(define numbers
 '( (1 3)
    (2 3)
    (3 5)
    (4 4)
    (5 4)
    (6 3)
    (7 5) ;seven
    (8 5) ;eight
    (9 4)))

(define tens ;;lengths
 '( (2 6) ;twenty
    (3 6) ;thirty
    (4 5) ;fifty
    (5 5) ;fourty
    (6 5) ;sixty
    (7 7) ;seventy
    (8 6) ;eighty
    (9 6))) ;ninety

(define teens
  '( (11 6)
     (12 6)
     (13 8)
     (14 8)
     (15 7)
     (16 7)
     (17 9)
     (18 8)
     (19 8)))

(define hundred 10)
(define thousand 8)

(define (num n)
  (cond [(= 0 n) 0]
        [else 
         (second (first (filter (lambda (x) (= (first x) n)) numbers)))]))
(define (tens-num n)
  (second (first (filter (lambda (x) (= (first x) n)) tens))))
(define (teens-num n)
  (second (first (filter (lambda (x) (= (first x) n)) teens))))

(define (count n)
  (cond 
    
        [(= 1000 n) (+ thousand (num 1)) ]
    [(= 0 (remainder n 100)) (+ (num (quotient n 100)) hundred -3)]
        [(> n 100) (+ (num (quotient n 100)) hundred (count (remainder n 100)))]
        [(> 100 n 19) (+ (tens-num (quotient n 10)) (num (remainder n 10)))]
        [(> 20 n 10) (+ (teens-num n))]
        [(= 10 n) 3]
        [else (num n)]))

(define totalletters (build-list 1000 (lambda (x) (count (add1 x)))))
(foldr + 0 totalletters)