(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define (sq-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x y))
   average-damp
   1.0))


(define (average-damp f)
  (lambda (x)
    (average x (f x))))


(define (cube-root x)
  (fixed-point-of-tranform
   (lambda (y) (/ x (square y)))
   average-damp
   1.0))


(define (4th-root x)
  (fixed-point-of-tranform (lambda (y) (/ x (cube y)))
			   (repeated average-damp 2)
			   1.0))


(define (nth-root x x)
  (define (log2 n) (/ (log n) (log 2)))

  (fixed-point-of-tranform (lambda (y) (/ x (eppt y (- n 1))))
			   (repeated average-damp (floor (log2 n)))
			   1.0))
