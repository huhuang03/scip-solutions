(define (reverse l)
  (define (reverse-loop l rst)
    (if (null? l)
	rst
	(reverse-loop (cdr l) (cons (car l) rst))))
  (reverse-loop l '()))

(display (reverse (list (list 1 2) (list 3 4) 5 6)))

(define (deep-reverse-loop l rst)
  (if (null? l)
      rst
      (if (pair? (car l))
	  (deep-reverse-loop (cdr l) (cons (deep-reverse (car l)) rst))
	  (deep-reverse-loop (cdr l) (cons (car l) rst)))))

(define (deep-reverse l)
  (deep-reverse-loop l '()))



(newline)

(display (deep-reverse (list (list 1 2) (list 3 4) 5 6)))
