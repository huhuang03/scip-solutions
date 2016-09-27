(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter rst k)
    (if (= 1 k)
	rst
	(iter (compose f rst) (- k 1))))

  (iter f n))

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ dx x)))) 3.0))

(define (smooth-times f dx times)
  (repeated (smooth f dx) times))
