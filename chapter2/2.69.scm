(define (successive-merge pairs)
  (if (= (length pairs) 1)
      (car pairs)
      (successive-merge
       (adjoin-code-set (make-code-tree (car paris)
                                        (cadr pairs))
                        (cddr pairs)))))
