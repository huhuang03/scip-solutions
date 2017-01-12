(define (call-the-cops)
  (display "Calling the cops")
  (error "Too many bad passwrods"))

(define (make-alarm-account balance password)
  (define bad-passwords 0)
  (define (withdraw amount)
    (if (>= balance amont)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch key m)
    (cond ((not (eq? key password))
           (set! bad-passwords (+ bad-passwords 1))
           (if (> bad-passwords 7)
               (lambda (v) (call-thp-cops))
               (lambda (v) "Incorrect password")))
          ((eq? m 'withdraw) (set! bad-passwords 0)
           withdraw)
          ((eq? m 'deposit) (set! bad-passwords 0)
           deposit)
          ((eq? m 'balance) balance)
          (else (error "Unkown request -- MARE-ACCOUNT" m))))
  dispatch)