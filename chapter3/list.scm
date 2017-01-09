(define (last-pair x)
  (if (null? (cdr x))
      x
      (lst-pair (cdr x))))
