(define (last-pair list)
  (define (last list)
    (if (null? (cdr list))
	(car list)
	(last (cdr list))))
  (cons (last list) '()))

(last-pair (list 23 72 149 34))
