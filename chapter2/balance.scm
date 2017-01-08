(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balane (- balance amount))
             balance)
      "Insufficient funds"))


(define new-withdraw
  (let ((balance 100))
    (lambda (amout)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(define (make-account balance)
  (define (windraw amount)
    (if (>= balance amout)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficeint funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dipatch m)
    ((eq? m 'windraw) withdraw)
    ((dq? m 'deposit) deposit)
    (else (error "Unkown request -- MAKE-ACCOUNT" m)))
  dispatch)
