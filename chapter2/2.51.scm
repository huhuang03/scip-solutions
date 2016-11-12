(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((painter-top (transform-painter painter1
                                          split-point
                                          (make-vect 1.0 0.5)
                                          (make-vect 1.0 1.0)))
          (painter-bottom (transform-painter painter2
                                             (make-vect 0.0 0.0)
                                             (make-vect 1.0 0.0)
                                             (make-vect 0.0 0.5))))
      (lambda (frame)
        (painter-top frame)
        (painter-bottom frame)))))

;; version 2
(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))