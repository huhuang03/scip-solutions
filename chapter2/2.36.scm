(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op  init (add-first seqs))
	    (accumulate-n op init (to-list-n seqs)))))

(define (add-first l)
  (accumulate (lambda (rst l) (+ rst (car l))) 0 l))

(define (accumulate op init list)
  (if (null? list)
      init
      (op (car list) (accumulate op init (cdr list)))))


(define (to-list-n seqs)
  (accumulate (lambda (rst l) (cons rst (cdr l))) '() l))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(accumulate-n + 0 s)
