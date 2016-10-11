(define (fringe x)
  (define (fringe-iter x rst)
    (cond ((null? x) rst)
	  ((not (pair? x)) (fringe-iter '() (cons x rst)))
	  (else (fringe-iter (car x) (fringe-iter (cdr x) rst)))))
  (fringe-iter x '()))


(define x (list (list 1 2) (list 3 4)))

(display (fringe x))

(newline)

(display (fringe (list x x)))
