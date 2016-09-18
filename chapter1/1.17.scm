(define (* a b)
  (if (= 0 b)
    0
    (if (even? b)
      (* (double a) (halve b))
      (+ a (* a (- b 1))))))
