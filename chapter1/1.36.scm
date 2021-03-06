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


(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)

(display "使用平均阻尼")
(newline)

(fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 2)




