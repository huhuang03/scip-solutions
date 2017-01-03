(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multipiler exp) var))
          ))
        (else (error "unkown expression type -- DERIV" exp))))


;; a) number?和same-variable?没有操作类型的区分

;; b)
(define (devir-sum exp var)
  (make-sum (deriv (addend exp) var)
            (deriv (augend exp) var)))

(define (deriv-product exp var)
  (make-sum (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multipiler exp) var)
                          (multiplicand exp))))

(define (install-deriv)
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

(define (deriv-exponentiation expr var)
  'someOperator)

(define (install-exponentiation)
  (put 'deriv '** deriv-exponentiation)
  'done)

;; d) exchange type and operator
