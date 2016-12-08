(define (lookup given-key recoders-tree)
  (cond
   ((null? recoders-tree) faslse)
   ((bigger? recoders-tree (key (node recoders-tree)) (lookup given-key (right recoders-tree))))
   ((equals? recoders-tree (key (node recoders-tree)) (node recoders-tree)))
   (else (lookup given-key (left recoders-tree)))
   )
)
