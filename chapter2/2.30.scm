(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (* sub-tree sub-tree)))
       tree))

(display (square-tree
    (list 1
	(list 2 (list 3 4) 5)
	(list 6 7))))

(newline)

;; do not use map
(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (* tree tree))
	(else (cons
	       (square-tree (car tree))
	       (square-tree (cdr tree))))))

(display (square-tree
    (list 1
	(list 2 (list 3 4) 5)
	(list 6 7))))

(newline)
