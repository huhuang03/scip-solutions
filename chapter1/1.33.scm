(define (filtered-accumulate combiner null-value term a filter b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combinere (term a) (filtered-accumulate combiner null-value term (+ a 1) b))
	  (filtered-accumulate combiner null-value term (+ a 1) filter b))))


(define (find-prime a b)
  (filtered-accumulate + 0 echo prime? b))

(define (find-prime a b)
  (define (prime_1 k)
    (prime? k b))
  (filtered-accumulate * 1 echo prime_1 b))
