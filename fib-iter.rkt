#lang racket
(define (fib-iter-helper n a b)
  (cond ((= n 1) b)
        ((= n 0) a)
        (else (fib-iter-helper (- n 1) b (+ a b)))
      )
)

(define (fib-iter n)
  (fib-iter-helper n 0 1)
  )