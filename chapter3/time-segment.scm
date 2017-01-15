(define (make-time-segment time queue)
  (cons time queue))

(define (segment-time s) (car s))
(define (segment-queue s) (cdr s))

(define (make-agenda) (list 0))


(define (current-time agenda) (car agenda))

(define (set-current-time! agenda time)
  (set-car! agenda time))
