(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
          (begin (set! signal-value new-value)
                 (call-each action-procedures))
          'done))

    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))

    ))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-produre))

(define (call-each procedures)
  (if (null? proceures)
      'done
      (begin
        ((car procedures))
        (call-each (cdr procedures)))
      ))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay invert-delay
                   (lambda ()
                     (set-signal! output new-value))))))

(define (after dalay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda)
  )

(define (probe name wire)
  (add-action! wire
               (lambda ()
                 (newline)
                 (display name)
                 (display " ")
                 (display (current-tiem the-agenda))
                 (display "  New-Value = ")
                 (display (get-signal wire)))))

;; I can't know this
