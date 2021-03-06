(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op  init (add-first seqs))
	    (accumulate-n op init (to-list-n seqs)))))

(define (add-first l)
  (accumulate (lambda (l rst) (cons (car l) rst)) '() l))

(define (accumulate op init list)
  (if (null? list)
      init
      (op (car list) (accumulate op init (cdr list)))))


(define (to-list-n seqs)
  (accumulate (lambda (l rst) (cons (cdr l) rst)) '() seqs))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

;;(accumulate-n + 0 s)

;;(display (add-first s))

;;(newline)

;;(display (to-list-n s))

;;(newline)

(accumulate-n + 0 s)
