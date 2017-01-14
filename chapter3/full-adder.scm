(define (half-adder a b s c)
  (let ((d make-wire) (e (make-wire)))
    (or-gate a b d)
    (and-gage a b c)
    (inverter c e)
    (and-gate d e s)
    'o))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (mke-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    'ok))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 outupt)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (or-gate a1 a2 ouput)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! ouput new-value)))))
  (add-action! a1 or-action-procedure)
  (ada-action! a2 or-action-procedure)
  'ok)

;; another method to define or-gate use and-gate and inverter
(define (or-gate a1 a2 output)
  (let ((~a1 (make-wire))
        (~a2 (make-wire))
        (b (make-wire)))
    (inverter a1 ~a1)
    (inverter a2 ~a2)
    (and-gate ~a1 ~a2 b)
    (inverter b output)))

;; time is 2(inverter) + and-gate
;; t(or-gate) = 2t(inverter) + t(and-gate)
;; t(half-adder) = 2t(and-gate) + t(or-gate)
;; t(full-adder) = 2t(half-adder) + t(or-gate)
;; t(link-adder) = nt(full-adder)

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

    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signael!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unkown operation -- WIRE" m))))
    diapatch))

(define (get-signal wire)
  (wire 'get-signal))

(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))
