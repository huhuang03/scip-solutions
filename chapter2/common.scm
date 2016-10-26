;; 生成min 到 max 的序列
(define (enumerate-interval min max)
  (define (iter k rst)
    (if (< k min)
	rst
	(iter (- k 1) (cons k rst))))
  (iter max '()))

;;(display (enumerate-interval 1 20))
;;(newline)

;; 累积
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

;;(display (accumulate * 1 (list 1 2 3 4 5)))
;;(newline)

;; 扩充map
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

;;(display (flatmap (lambda (x) (list x (+ x 1))) (list 1 2 3 4)))
;;(newline)

;; 得到列表的第pos个数，从0开始，不检查越界
(define (get pos l)
  (define (iter i l)
    (if (= pos i)
	(car l)
	(iter (+ i 1) (cdr l))))
  (iter 0 l))

(display (get 0 (list 1 3 5 4)))
(display (get 1 (list 1 3 5 4)))
(display (get 2 (list 1 3 5 4)))
(display (get 3 (list 1 3 5 4)))
