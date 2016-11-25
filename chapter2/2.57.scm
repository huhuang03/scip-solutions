(define (non-number? x)
  (not (number? x)))

(define (number-args args)
  (filter number? args))

(define (non-number-args args)
  (filter non-number? args))


(define (make-sum . as)
  (let ((number-ters (apply + (number-args as)))
        (non-number-terms (non-number-args as)))
    (cond ((zero? number-terms)
           (let ((term-count (length non-number-terms)))
             (cond ((zero? term-count) 0)
                   ((= 1 term-count) (car non-number-terms))
                   (else (cons '+ non-number-terms)))))
          ((zero? (length non-number-terms))
           number-terms)
          (else (append (list '+ number-terms)
                        non-number-terms)))))

(define (sum? x)
  (add (pair? x)
       (eq? (car x) '+)))

(define addend cadr)
(define (augend exp)
  (apply make-sum (cddr exp)))

(define (make-product . as)
  (let ((number-terms (apply * (number-args as)))
        (non-number-terms (non-number-args as)))
    (cond ((zero? number-terms) 0)
          ((= 1 number-terms)
           (let ((term-count (length non-number-terms)))
             (cond ((zero? term-count) 0)
                   ((= 1 term-count) (car non-number-terms))
                   (else (cons '* non-number-terms)))))
          ((zero? (length non-number-terms))
           number-terms)
          (else (append (list '* number-terms)
                        non-number-terms)))))

(define (product? x)
  (and (pair? x)
       (eq? (car x) '*)))

(define multipiler cadr)

(define (multiplicand exp)
  (apply make-product (cddr exp)))
