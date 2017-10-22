#lang racket
(require rackunit)
(require rackunit/text-ui)


; Търсим сумата от цифрите на дадено число.
; Процедурата да генерира итеративен процес.
(define (sum-digits number)
  (define (helper number result)
    (if(= number 0)
       result
       (helper (quotient number 10) (+ result (modulo number 10)))
    )
  )
  (helper number 0)
)

(define tests
  (test-suite "to-decimal tests"
    (check-equal? (sum-digits 11001) 3)
    (check-equal? (sum-digits 804357) 27)
    (check-equal? (sum-digits 981) 18)
    (check-equal? (sum-digits 900) 9)
  )
)

(run-tests tests 'verbose)
