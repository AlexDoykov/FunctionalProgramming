#lang racket
(require rackunit)
(require rackunit/text-ui)
; 1.7 - Търсим процедура, която проверява дали едно число е палиндром.
; Трябва да работи и за отрицателни числа.


(define (count-digits number)
  (if (< number 0)
      (count-digits(* number -1))
      (if(< number 10) 1 (+ (count-digits(quotient number 10)) 1))
  )
)

(define (reverse-digits number)
      (if (and (> number -10) (< number 10)) number (+ (* (remainder number 10) (expt 10 (count-digits (quotient number 10)))) (reverse-digits(quotient number 10))))
)

(define (palindrome? number)
  (if (< number 0)
      (palindrome? (* number -1))
      (if (= number (reverse-digits number)) #t #f)
  )
)

(define tests (test-suite
  "Palindrome tests"

  (test-case "Should function correctly"
    (check-true (palindrome? 12321))
    (check-false (palindrome? 872))
    (check-true (palindrome? 2))
    (check-true (palindrome? 310013))
    (check-true (palindrome? -21212))
)))

(run-tests tests 'verbose)
