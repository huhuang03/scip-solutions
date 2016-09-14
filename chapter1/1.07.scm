; 太大会达不到， 太小会很快达到， 精度不够
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average guess x)
  (/ (+ guess x) 2))


(define (sqrt x)
  (sqrt-iter 1.0 x))

; 改良之后

(define (sqrt x)
  (sqrt-iter 1.0 0 x))


(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
    guess
    (sqrt-iter (improve guess x) guess x)
    ))

(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) (/ guess 100000)))
