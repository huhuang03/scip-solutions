(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (display "trace: ")
      (display guess)
      (display " -> ")
      (display next)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))

  (try first-guess))


;;(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1)

(define (fn x) (+ 1 (/ 1.0 x)))

(fixed-point fn 1)
