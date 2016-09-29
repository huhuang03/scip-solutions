(define (div-interval x y)
  (if (zero (interval-width y))
      (error "Can't div zero width interval")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))
