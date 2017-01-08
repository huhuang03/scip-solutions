(define (make-accumulator init)
  (let ((sum init))
    (lambda (item)
      (begin (set! sum (+ sum item))
             sum))))

(define A (make-accumulator 5))

(A 10)

(A 10)
