;; 总集合 = （包含第一个元素的） + （不包含第一个元素的）
(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (item) (cons (car s) item)) rest)))))

(subsets (list 1 2 3))

;; 因为没有nil 所以这个就不好弄了啊
