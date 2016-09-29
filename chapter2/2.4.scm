;; cons car cdr
(define (cons x y)
  (lambda (m) (m x y)))


(define (car z)
  (z (lambda (x y) x)))

(define (cdr z)
  (z (lambda (x y) y)))


(display (car (cons 1 2)))

(newline)

(cdr (cons 1 2))

;; ((lambda (x y) x) 1 2) = 1
;; ((lambda (x y) y) 1 2) = 1

;; so (car (cons x y)) = x
;; so (cdr (cons x y)) = y
