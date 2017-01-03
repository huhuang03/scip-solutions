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
