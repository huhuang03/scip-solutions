(define (union-set s1 s2)
  (list->tree (union-list (tree->list s1) (tree-list s2))))

(define (intersection-set s1 s2)
  (list-tree (intersection-list (tree->list s1) (tree-list s2))))
