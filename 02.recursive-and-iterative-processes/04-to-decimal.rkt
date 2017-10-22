#lang racket
(require rackunit)
(require rackunit/text-ui)


; Обръщаме число от двоична в десетична бройна система
(define (to-decimal number)
  (define (to-decimal-helper number power)
    (if (= number 0)
        number
        (+ (to-decimal-helper (quotient number 10) (+ power 1)) (* (expt 2 power) (modulo number 10)))
    )
  )
  (to-decimal-helper number 0)
)

(define tests
  (test-suite "to-decimal tests"
    (check-equal? (to-decimal 11001) 25)
    (check-equal? (to-decimal 1100011) 99)
    (check-equal? (to-decimal 1111111) 127)
    (check-equal? (to-decimal 0) 0)
    (check-equal? (to-decimal 1) 1)
  )
)

(run-tests tests 'verbose)
