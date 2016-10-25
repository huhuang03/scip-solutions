(define (uniqure-pairs n)
  (accumulate append
	      nil
	      (map (lambda (i)
		     (map (lambda (j) (list i j))
			  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n))))


(define (unique-three-pairs n)
  (flatmap (lambda (i) (map (lambda (x) (car i x)) (unique-pairs n)))
	   (enumerate-interval 1 n)))

(define (sum-n item)
  (= n (+ (car item) (cadr item) (cadr (cdr item)))))


(define (get-sum-n n)
  (filter sum-n (unique-three-pairs n)))
