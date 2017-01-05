;; some project and up operator
;; forexample in the rational package
(define (project r)
  (make-integer (truncate (/ (number r) (denom r)))))

(put 'project '(rational) (lambda (x) (project x)))

;; and drop operator
(define (drop z)
  (if (= (type-level z) 1)
      z
      (let ((projected (project z)))
        (if (equ? z (raise projected))
            (drop projected)
            z))))

