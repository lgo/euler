#lang racket

;;Solved mathematically ->
;Consider 2 ... 20 in prime factor form.
;2   3   4   5   6   7   8    9   10   11    12   13   14   15  16    17    18   19   20
;2   3  2^2  5  2*3  7  2^3  3^2  2*5  11  2^2*3  13  2*7   5*3 2^4   17  2*3^2  19  2^2*5

;the lcm of them will be the maximum of the prime factors exponent, by observation that is
;2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19
; -> 232792560