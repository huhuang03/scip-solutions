(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount (except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))

(define (no-more? list)
  (null? list))

(define (except-first-denomination list)
  (cdr list))

(define (first-denomination list)
  (car list))

(define us-coins (list 50 25 10 5 1))
(display (cc 100 us-coins))


;; chane list order
(newline)
(display "after change list order: ")

(define us-coins (list 50 25 10 5 1))
(display (cc 100 us-coins))


(newline)
(display "uk-coins: ")
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(display (cc 100 uk-coins))
(newline)
