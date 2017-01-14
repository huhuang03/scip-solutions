;; t(link-adder) = nt(full-adder)

(define (ripple-carry-adder as bs ss c-out)
  (define (last-bit? as)
    (null? (cdr as)))

  (define (ripple-adder-iter as bs ss ic-in ic-out)
    (if (null? as)
        'ok
        (full-adder (car as)
                    (car bs)
                    ic-in
                    (car ss)
                    (if (last-bit? as) c-out ic-out))
        (ripple-adder-iter (cdr as)
                           (cdr bs)
                           (cdr ss)
                           ic-out
                           (make-wire))))

  (let ((initial-in (make-wire))
        (sum (make-wire)))
    (ripple-adder-iter as bs ss initial-in sum)))
