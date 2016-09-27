(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter rst k)
    (if (= 1 k)
	rst
	(iter (compose f rst) (- k 1))))

  (iter f n))

(define (square x)
  (* x x))

((repeated square 2) 5)
