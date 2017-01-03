(define (=zero? x) (apply-generic '=zero? x))

(put '=zero? '(scheme-number) zero?)

(define (=zeor? z1) (zero? (magnitude z1)))

(put 'zero? '(complex) =zero?)
