(define (* b n)
  (*-iter b n 0))

(define (*-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (*-iter (double b) (halve n) a))
        (else (*-iter b (- n 1) (+ a b)))))

