(define (iterative-improve test improve)
  (lambda (x)
    (if (test x)
	x
	((iterative-improve test improve) (improve x)))))


(define (test x)
  (lambda (guess)
    (< (abs (- (square guess) x)) 0.0001)))

(define (improve x)
  (lambda (guess)
    (average guess (/ x guess))))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  ((iterative-improve (test x) (improve x)) 1.0))


(sqrt 4)
