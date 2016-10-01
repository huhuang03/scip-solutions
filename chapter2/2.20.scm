(define (same-parity . l)
  (let ((to-test (remainder (car l) 2)))
    (define (iter l)
      (if (null? l)
	  l
	  (if (= to-test (remainder (car l) 2))
	      (cons (car l) (iter (cdr l)))
	      (iter (cdr l)))
	 ))
    (iter l)))

(display (same-parity 2 3 4 5 6 7))
(newline)
(same-parity 1 2 3 4 5 6 7)
