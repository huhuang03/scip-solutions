; 杨辉三角新

(define (v row col)
  (cond 
    ((= col 1) 1)
    ((= row col) 1)
    ((> col row) 0)
    (else (+ (v (- row 1) col) (v (- row 1) (- col 1))))))

