#lang racket
(require math/number-theory)
(foldr + 0 (filter prime? (range 1 2000000)))