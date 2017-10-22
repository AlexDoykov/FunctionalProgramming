#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (count-digits number)
  (if (< number 0)
      (count-digits(* number -1))
      (if(< number 10) 1 (+ (count-digits(quotient number 10)) 1))
  )
)

(define (reverse-digits number)
      (if (and (> number -10) (< number 10)) number (+ (* (remainder number 10) (expt 10 (count-digits (quotient number 10)))) (reverse-digits(quotient number 10))))
)

; Обръщаме число в двоична бройна система
(define (to-binary number )
      (cond
        ((= number 0) (* number 10))
        (else (if (= (remainder number 2) 0)
              (* (to-binary (quotient number 2)) 10)
              (+ (* (to-binary (quotient number 2)) 10) 1)
))))

(define tests
  (test-suite "to-binary tests"
    (check-equal? (to-binary 10) 1010)
    (check-equal? (to-binary 0) 0)
    (check-equal? (to-binary 8) 1000)
    (check-equal? (to-binary 1) 1)
    (check-equal? (to-binary 15) 1111)
  )
)

(run-tests tests 'verbose)
