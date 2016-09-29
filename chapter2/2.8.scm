(define (sub-interval i1 i2)
  (make-interval (- (lower-bound i2) (upper-bound i1))
		 (- (upper-bound i2) (lower-bound i1))))
