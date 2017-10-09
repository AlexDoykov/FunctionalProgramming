#lang racket
(require rackunit)
(require rackunit/text-ui)
;1.3 - Съчинете процедура, която по дадени три числа, намира сумата от квадратите на по-големите две от тях.
; За по-удобно, може да разбиете задачата на по-малки такива.

(define (squares-sum-bigger-two a b c)
  (void)
)

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
