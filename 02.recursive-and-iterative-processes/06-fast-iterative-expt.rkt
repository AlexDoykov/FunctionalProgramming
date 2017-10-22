#lang racket
(require rackunit)
(require rackunit/text-ui)

; Стъпвайки на дефиницията за бързо повдигане на степен,
; търсим такава, която генерира итеративен процес
(define (expt x n)
  (define (helper x n result)
    (cond
      ((= n 0) result)
      ((= (modulo n 2) 1) (helper (* x x) (quotient n 2) (* result x)))
      (else (helper (* x x) (quotient n 2) result))
      )
    )
  (helper x n 1)
)

(define tests
  (test-suite "expt tests"
    (check-equal? (expt 4 4) 256)
    (check-equal? (expt 29139123 0) 1)
    (check-equal? (expt 3 4) 81)
    (check-equal? (expt 2 1) 2)
  )
)

(run-tests tests 'verbose)
