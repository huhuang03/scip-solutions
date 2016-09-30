(define (reverse l)
  (define (reverse-loop l rst)
    (if (null? l)
	rst
	(reverse-loop (cdr l) (cons (car l) rst))))
  (reverse-loop l '()))

(reverse (list 1 2 3 4 5))
