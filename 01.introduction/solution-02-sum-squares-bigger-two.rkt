#lang racket
(require rackunit)
(require rackunit/text-ui)
;1.3 - Съчинете процедура, която по дадени три числа, намира сумата от квадратите на по-големите две от тях.
; За по-удобно, може да разбиете задачата на по-малки такива.

(define (squares-sum-bigger-two a b c)
  (if(< a b)
     (if(< c b)
        (if(< c a)
           (+ (* b b) (* a a))
           (+ (* b b) (* c c)))
        (+ (* b b) (* c c)))
     (if(< c a)
        (if(< b c)
           (+ (* a a) (* c c))
           (+ (* b b) (* a a)))
        (+ (* a a) (* c c))
        )
))

(define tests
  (test-suite
    "Sum of squares tests"

    (test-case "Random tests"
      (check-equal?
        (squares-sum-bigger-two 1 5 6)
        61
      )
      (check-equal?
        (squares-sum-bigger-two 2 3 3)
        18
      ))))

(run-tests tests 'verbose)
