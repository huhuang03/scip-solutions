;; 递归版本
(define (cont-frac n d k)
  (define (iter n d k i)
    (if (< i k)
	(/ (n i) (+ (d i) (iter n d k (+ i 1))))
	(/ (n i) (d i))))

  (iter n d k 1))

(cont-frac (lambda (x) 1.0)
	   (lambda (x) 1.0)
	   11)


;; 迭代版本
(define (cont-frac n d k)
  (define (iter i rst)
    (cond ((= i 0) rst)
	  (else (iter (- i 1.0) (/ (n i) (+ (d i) rst))))))
  (iter k 0))


(define (euler-e)
  (+ 2
    (cont-frac (lambda (x) 1.0)
	    (lambda (x) (cond (= 1 (remainder x 3) 1)
				(= 2 (remainder x 3) (* 2 (+ 1 (/ (+ x 1) 3))))
				(= 0 (remainder x 3) 1))
			    )
	    500)
))


(euler-e)
