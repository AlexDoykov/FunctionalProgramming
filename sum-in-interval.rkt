#lang racket

(define (sum-helper n m result)
  (if(= n (+ m 1))
        result
        (sum-helper (+ n 1) m (+ result n))
  )
)

(define (sum n m)
  (sum-helper n m 0)
)