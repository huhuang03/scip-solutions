(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))


(define (center i)
  (/ (+ (low-bound i) (upper-bound i)) 2))


(define (widht i)
  (/ (- (upper-bound i) (low-bound i)) 2))


(define (make-center-percent c tolerance)
  (make-center-width c (* c (/ tolerance 100))))


(define (percent interval)
  (/ (* 100 (width interval))
     (center interval)))
