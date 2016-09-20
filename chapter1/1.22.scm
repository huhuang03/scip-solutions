(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))


(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display (* 10000 elapsed-time)))


(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a ) 0))


(define (search-for-primes min max)
  (search-for-primes-iter max min))

(define (search-for-primes-iter max starter)
  (cond ((> starter max) 0)
	((odd? starter)
	 (timed-prime-test starter)
	 (search-for-primes-iter max (+ starter 2)))
	(else (search-for-primes-iter max (+ starter 1)))))

(define (odd? n)
  (= 1 (remainder n 2)))
