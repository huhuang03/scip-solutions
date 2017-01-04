(define (add x y) (apply-generic 'add x y))

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'make 'schme-number
       (lambda (x) (tag x))))

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(define (install-rational-package)
  (define (number x) (car x))
  (define (add-rat x y)
    (make-rat (+ (* (number x) (denom y))
                 (* (number y) (denom x)))
              (* (denom x) (denom y))))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y)))))

(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (install-complex-package)
  (define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (reap-part z2))
                         (+ (imag-part z1) (imag-part z2))))
  put 'add (complex complex)
  (lambda (z1 z2) (tag add-complex z1 z2)))

(define (scheme-number->complex n)
  (make-complex-from-real-imag (conents n) 0))

(put-coercion 'scheme-number 'complex scheme-number->complex)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types "
                                (list op type-tags))))))))))
