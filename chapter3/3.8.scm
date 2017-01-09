(define f
  (let ((seen-zero? #f))
    (lambda (x)
      (cond (seen-zero? 0)
            (else (set! seen-zero? #t)
                  x)))))
