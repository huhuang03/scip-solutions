;; cons car cdr
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (how-times n base)
  (cond ((not (zero? (remainder n base))) 0)
	(else (+ (how-times (/ n base) base) 1))))

(define (car z)
  (how-times z 2))

(define (cdr z)
  (how-times z 3))


(define test-pair (cons 11 7))


(display (car test-pair))

(newline)

(cdr test-pair)

