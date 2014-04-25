#lang racket

;;given the definition of a base 2 palindrome, only odd numbers are base 2 palindromes...

(define (is-palindrome? n)
  (define digs (string->list (number->string n)))
  (andmap char=? digs (reverse digs)))

(define palindromes (filter is-palindrome? 
                            (filter odd? (build-list 1000000 (lambda (x) (add1 x))))))

(define (decimal-to-binary n)
  (define binary-list (list))
  (define bd 0)
  (define bc "")
  (define (loop n1)
    (cond
      ((= n1 0))
      (else
       (set! bd (+ (modulo n1 2) 48))
       (set! bc (integer->char bd))
       (set! binary-list (append binary-list (list bc)))
       (loop (floor (/ n1 2))))))
  (cond
    ((= n 0) 0)
    (else
     (loop n)
     (set! binary-list (reverse binary-list))))
  binary-list)

(define (is-bin-palindrome? n); n is binary list
  (define bin (decimal-to-binary n))
  (andmap char=? bin (reverse bin)))

(define double-base-palindromes (filter is-bin-palindrome? palindromes))

(foldr + 0 double-base-palindromes)