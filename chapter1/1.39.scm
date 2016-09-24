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



(define (tank-cf x k)
  (cont-frac (lambda (x)
	       (if (= 1 x)
		   1
		   (- (* x x))))
	     (lambda (x)
	       (+ 1 (* x 2)))
	     k))
