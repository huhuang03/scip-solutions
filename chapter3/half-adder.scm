(define (half-adder a b s c)
  (let ((d make-wire) (e (make-wire)))
    (or-gate a b d)
    (and-gage a b c)
    (inverter c e)
    (and-gate d e s)
    'o))
