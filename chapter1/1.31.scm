(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (iter a)))))

  (iter a 1))

;; 递归版本
(define (product term a next b)
  (if (> a b)
      1
      (* (iter a) (product term (next a) next b))))
