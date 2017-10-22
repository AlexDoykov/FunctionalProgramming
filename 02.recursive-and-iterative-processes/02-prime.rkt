#lang racket
(require rackunit)
(require rackunit/text-ui)
; Искаме да проверим дали число е просто.

(define (prime? number)
  (define (prime-helper number num)
    (cond
      ((or (= number 0) (= number 1)) #f)
      ((= (modulo number num) 0) #f)
      ((<= num (sqrt number)) #t)
      (else (prime-helper number (- num 1)))
      )
    )
   (prime-helper number (- number 1))
)

(define tests
  (test-suite "prime? tests"
    (check-false (prime? 1))
    (check-true (prime? 5))
    (check-false (prime? 1729))
    (check-false (prime? 41041))
  )
)

(run-tests tests 'verbose)
