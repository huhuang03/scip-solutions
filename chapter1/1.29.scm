(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; Simpson's rule
;; (h/3)[y0 + 4y1 + 2y2 + 4y3 + ... + 4yn-1 + yn]
;; h  = (b-a)/n
;; yk = f(a+kh)
(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (term k)
      (let ((y (f (+ a (* k h)))))
	(cond ((or (zero? k)
		   (= k n)) y)
	      ((even? k) (* 2 y))
	      (else (* 4 y)))))
    (* (/ h 3)
       (sum term 0 inc n))))

;; 此程序无法运行， 显示b不是可调用，但是我实在是看不出哪里调用了b啊
