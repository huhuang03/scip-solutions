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

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

(define (safe? k positions)
  (let ((last (get (- k 1) positions)))
    (define (iter i)
      (let ((current (get (- i 1) positions)))
	(if (= i k)
	    #t
	    (if (or (= last current) (= (- k i) (last current)) (= (- (- k i)) (last current)))
		#f
		(iter (+ i 1))))))
    (iter 1)))

;;(define (safe? k positions) #t)


(display (queens 3))
(newline)
