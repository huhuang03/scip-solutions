; 如果n<3 那么f(n) = 3， 如果n>=3，那么f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)
; 递归
(define (f1 n)
  (cond
    ((or (= n 1) (= n 2) (= n 0)) n)
    (else (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3)))))))

; 迭代

(define (f-iter a b c n)
  (cond 
    ((= 0 n) c)
    (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))

(define (f2 n)
  (f-iter 2 1 0 n))
