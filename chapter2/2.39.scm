(define (reverse sequence)
  (fold-right (lambda (x y) (append (list x) y)) sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) sequence))
