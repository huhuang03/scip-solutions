(define (cons x y)
  (define (dispatch m)
    (cond ((eq? m 'car) x)
          ((eq? m 'cdr) y))))

(define (car z) (z 'car))
(define (cdr z) (z 'cdr))
