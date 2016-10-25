(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op  init (add-first seqs))
	    (accumulate-n op init (to-list-n seqs)))))

(define (add-first l)
  (accumulate (lambda (l rst) (cons (car l) rst)) '() l))

(define (accumulate op init list)
  (if (null? list)
      init
      (op (car list) (accumulate op init (cdr list)))))


(define (to-list-n seqs)
  (accumulate (lambda (l rst) (cons (cdr l) rst)) '() seqs))


;; 向量点乘
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; 矩阵乘向量
(define (matrix-*-vertor m v)
  (map (lambda (iv) (dot-product iv v)) m))

;; 矩阵转置
(define (tranpose mat)
  (acuumulate-n cons '() mat))

;; 矩阵 * 矩阵
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map dot-product cols m)))
