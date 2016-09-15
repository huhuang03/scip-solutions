(define (fast-expt b n a)
  (cond ((= 0 n) a)
        ((even? n) (fast-expt (square b) (/ n 2) a))
        (else (fast-expt b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))
