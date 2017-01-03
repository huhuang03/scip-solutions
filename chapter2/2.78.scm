(define (attach-tag type-tag contents)
  (if (eq? type-tag 'scheme-number)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)))


(define (contents datum)
  (cond ((par? datum) (dr datum))
        ((number? datum) datum)))
