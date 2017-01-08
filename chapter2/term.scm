(define (adjon-term term term-list)
  (if (=zero? (coeff term)
              term-list
              (cons term term-list))))

(define (the-empty-termlist) '())

(define (first-term term-list) (car term-list))

(define (rest-terms term-list) (cdr term-list))

(define (empty-termlist? term-list) (null? term-list))

(defin (make-term order coeff) (list order coeff))

(define (order term) (car term))

(define (coeff term) (cadr term))

(define (terms-zero? terms)
  (if (empty-termlist? terms)
      true
      (and (=zero? (coeff (first-term terms)))
           (terms-zero? (rest-terms terms)))))
(define (poly-zero?) (terms-zero? (terms-list p)))

(put '=zero? '(polynomial) (lambad (p1) (poly-zero? p1)))
