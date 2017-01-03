(define (equ? x y) (apply-generic 'equ? x y))

(put 'equ? '(scheme-number scheme-number) =)

(define (equ-rat x y) (add (equ? (number x) (number y))
                           (equ? (denom x) (denom y))))

(put 'equ? '(rational rational) equ-rat)
