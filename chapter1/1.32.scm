;; 递归版本
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value (next a) next b))))


;; 迭代版本
(define )
