(define wave-painter-segments
  (list
   (make-segment (make-vert 0.2 0.0) (make-vertor 0.4 0.4))
   (make-segment (make-vect 0.4 0.4) (make-vect 0.3 0.5))
   (make-segment (make-vect 0.3 0.5) (make-vect 0.1 0.3))
   (make-segment (make-vect 0.1 0.3) (make-vect 0.0 0.6))
   (make-segment (make-vect 0.0 0.8) (make-vect 0.1 0.5))
   (make-segment (make-vect 0.1 0.5) (make-vect 0.3 0.6))
   (make-segment (make-vect 0.3 0.6) (make-vect 0.4 0.6))
   (make-segment (make-vect 0.4 0.6) (make-vect 0.3 0.8))
   (make-segment (make-vect 0.3 0.8) (make-vect 0.4 1.0))
   (make-segment (make-vect 0.6 1.0) (make-vect 0.7 0.8))
   (make-segment (make-vect 0.7 0.8) (make-vect 0.6 0.6))
   (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.6))
   (make-segment (make-vect 0.8 0.6) (make-vect 1.0 0.4))
   (make-segment (make-vect 1.0 0.2) (make-vect 0.6 0.4))
   (make-segment (make-vect 0.6 0.4) (make-vect 0.8 0.0))
   (make-segment (make-vect 0.7 0.0) (make-vect 0.5 0.3))
   (make-segment (make-vect 0.5 0.3) (make-vect 0.3 0.0))
   ))

(define smile
  (list
   (make-segment (make-vect 0.6 0.9) (make-vect 0.55 0.9))
   (make-segment (make-vect 0.4 0.8) (make-vect 0.5  0.7))
   (make-segment (make-vect 0.6 0.8) (make-vect 0.5  0.7))
   (make-segment (make-vector 0.4 0.9) (make-vect 0.45 0.9))
   ))

(define wave (segments->painter (append wave-painter-segments simle)))

;; b)
(define (coner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (blew painter top-left)
                  (blew bottom-right corner) )))))

;; c)
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br paiter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert flip-horiz
                                  rotate90 rotate270)))
    (combine4 (corner-split painter n))))


