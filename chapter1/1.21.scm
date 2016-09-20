(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((dividers? test-divisor n) test-divisor)
	(find-divisor n (- test-divisor 1))))

(define (dividers? a b)
  (= (remainder b a) 0))
