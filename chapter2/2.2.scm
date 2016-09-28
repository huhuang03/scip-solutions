(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (let ((sp (start-segment s))
	(ep (end-segment s)))
    (make-point (/ (+ (x-point sp) (x-point ep)) 2.0)
		(/ (+ (y-point sp) (y-point ep)) 2.0))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display " , ")
  (display (y-point p))
  (display ")")
  (newline)
  )


(define s (make-segment (make-point 8 5)
			(make-point 5 9)))

(print-point (midpoint-segment s))
