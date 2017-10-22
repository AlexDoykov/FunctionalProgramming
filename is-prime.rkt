#lang racket
(define (is-prime-helper? n m)
  (cond
    ((= (modulo n m) 0) #f)
    ((>= (sqrt n) m) #t)
    (else (is-prime-helper? n (- m 1)))
  )
 )

(define (is-prime? n)
  (is-prime-helper? n (- n 1))
  )