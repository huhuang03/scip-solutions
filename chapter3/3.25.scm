(define (make-table)
  (define local-table (list '*table))

  (define (assoc key records)
    (cond ((null? records) #f)
          ((equals? key (caar records)) (car records))
          (else (assoc key (cdr records)))))

  (define (lookup keys)
    (let ((record (assoc keys (cdr local-table))))
      (if record
          (cdr record)
          #f)))

  (define (insert! keys value)
    (let ((record (assoc key (cdr local-table))))
      (if record
          (set-cdr! record value)
          (set-cdr! local-table (cons (cons keys value) (cdr local-table))))))

  (define (dispatch m)
    (cond ((eq? m 'lookup) lookup)
          ((eq? m insert!) insert!)
          (else (error "Unknown operation -- TBLE" m)))))
