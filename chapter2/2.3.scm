(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display " , ")
  (display (y-point p))
  (display ")")
  (newline)
  )

(define (length-segment s)
  (let ((sp (start-segment s))
	(ep (end-segment s)))
    (sqrt (+ (square (- (x-point ep) (x-point sp)))
	     (square (- (y-point ep) (y-point ep)))))))

;; constract
;; (define (make-rec bottom-segment left-segment) foo)
;; selector
;; (define (rect-widht) foo)
;; (define (rect-height) foo)

;; implements1
;; implements2 


;; uses
(define (perimeter rectangle)
  (* 2 (+ (rect-width rectangle)
	  (rect-height rectangle))))

(define (area rectangle)
  (* (+ (rect-width rectangle)
	(rect-height rectangle))))
