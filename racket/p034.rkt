#lang racket

;;maximum possible number is a 7 digit number ~2540161 (9! * 8 = 7 digit number)



(define facts
  '(1 1 2 6 24 120 720 5040 40320 362880))

(define (fact n)
  (list-ref facts n))

(define (dig-fact num)
  (foldr + 0 (map (lambda (x) (fact (string->number (list->string (list x)))))
       (string->list (number->string num)))))

(define lst (rest (rest (build-list 2540161 (lambda (x) x)))))
(define fact-nums (rest (filter (lambda (x) (= x (dig-fact x))) lst))) ; rest, because 2 showed up!
(foldr + 0 fact-nums)