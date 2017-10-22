#lang racket
(require rackunit)
(require rackunit/text-ui)

; Търсим процедура, която проверява дали дадено число завършва на дадено друго.

(define (ends-with? number test)
  (cond
    ((< test 10) (if (eq? (modulo number 10) (modulo test 10)) #t #f))
    ((not (eq? (modulo number 10) (modulo test 10))) #f)
    (else (ends-with? (quotient number 10) (quotient test 10)))
  )
)

(define tests
  (test-suite "ends-with? tests"
    (check-true (ends-with? 8317 17))
    (check-true (ends-with? 82 82))
    (check-false (ends-with? 8213 31))
    (check-false (ends-with? 211 0))
    (check-true (ends-with? 210 0))
    (check-false (ends-with? 2921 2))
  )
)

(run-tests tests 'verbose)
