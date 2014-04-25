#lang racket

;;maximum possible number is a 6 digit number ~370000 (9^5 * 6 < 7 digit number)

(define (fifth-pow-sum num)
  (foldr + 0 (map (lambda (x) (expt (string->number (list->string (list x))) 5))
       (string->list (number->string num)))))

(define lst (rest (rest (build-list 370000 (lambda (x) x)))))
(define dig-fifth-powers (filter (lambda (x) (= x (fifth-pow-sum x))) lst))
(foldr + 0 dig-fifth-powers)