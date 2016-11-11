;; use list
(define (make-frame origin edage1 edage2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edage1-frame frame)
  (car (cdr frame)))

(define (edage2-frame) frame
  (car (cdr (cdr frame))))


;; use cons
(define (make-frame origin edage1 edage2)
  (cons origin (cons edage1 edage2)))

(define (origin-frame frame)
  (car frame))

(define (edage1-frame frame)
  (car (cdr frame)))

(define (edage2-frame frame)
  (cdr (cdr frame)))

