(define (cuber-iter guess last-guess x)
  (if (good-enough? guess last-guess)
    guess
    (cuber-iter (improve guess x) guess x)))

(define (good-enough? guess last-guess)
  (< (abs (- guess last-guess)) (/ guess 100000)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))


(define (cuber x)
  (cuber-iter 1.0 0 x))
