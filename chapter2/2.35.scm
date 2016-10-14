(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (root)
		     (if (leaf? root)
			 1
			 (count-leaves root)))
		   t)))


(define (leaf? node)
  (not (pair? node)))

(define x (cons (list 1 2) (list 3 4)))

(display (count-leaves x))

(newline)

(count-leaves (list x x))
