(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))


(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (car branch)))

(define (leaf? branch)
  (not (pair? (branch-structure) branch)))

(define (branch-weight branch)
  (if (leaf? branch)
      (branch-structure branch)
      (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (+ (left-branch mobile) (right-branch mobile)))

(define (branch-balance? branch)
  (if (leaf? branch)
      #t
      (balance? (branch-structure branch))))

(define (balance? mobile)
  (and (= (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile)))))
