#lang racket

;;UNFINISHED SOLUTION, can't quite get the counter working properly.
;;possible fixes: just increment each month's worth of days instead of going day by day!!!

;;max-days: Int Int -> Int
;;Determine the amount of days in a given month on a year
(define (max-days month year)
  (define check (lambda (x) (= month x)))
  (cond [(ormap check '(4 6 9 11)) 30]
        [(= month 2) (if (leap? year) 29 29)]
        [else 31]))

;;divisible?: Int Int -> Boolean
;;Determine if a number is divisable by a divisor
(define (divisible? number divisor)
  (= 0 (modulo number divisor)))

;;leap?: Int -> Boolean
;;Determine if the year is a leap year or now
(define (leap? year)
  (and (divisible? year 4)
       (or (not (divisible? year 100))
           (divisible? year 400))))

(define (count-sundays day month year weekday counter max-day)
  (define month-change (> (add1 day) max-day))
  (define new-month (if (= month 12) 1 (add1 month)))
  (define new-year (if (and month-change (not (= new-month month))) (add1 year) year))
  (cond [(< year 1901) (count-sundays
                        (if month-change 1 (add1 day))
                        (if month-change new-month month)
                        new-year
                        (add1 weekday)
                        counter
                        (if month-change (max-days new-month new-year) max-day))]
        [(< 2000 year) counter]
        [else (count-sundays
               (if month-change 1 (add1 day))
               (if month-change (if (= month 12) 1 (add1 month)) month)
               new-year
               (add1 weekday)
               (if (and month-change (divisible? weekday 7)) (add1 counter) counter)
               (if month-change (max-days new-month new-year) max-day))]))

(count-sundays 1 1 1900 1 0 (max-days 1 1900))