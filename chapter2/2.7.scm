(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (let ((a (car i))
	(b (cdr i)))
    (max a b)))

(define (lower-bound i)
  (let ((a (car i))
	(b (cdr i)))
    (min a b)))
