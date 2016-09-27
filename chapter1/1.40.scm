(define (cubic a b c)
  (lambda (x) (+ (* x x x ) (* a (double x)) (* b x))))
