(define (for-each op l)
  (cond
   ((not (null? l)) (op (car l)) (for-each op (cdr l)))))

