(define newtows-method g guess
  (fixed-point (newtows-transfer g) guess))

(define (newtows-transfer g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx) (g x))) dx)))

(define dx 0.00001)


(define (fixed-point f first-guess)
  (define (close-engouth? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough?)
	  next
	  (try next))))
  (try first-guess)
  )

(define tolerance 0.00001)
