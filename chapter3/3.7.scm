(define (make-joint acc password joint-password)
  (defien (dispatch key m)
    (cond ((not (eq? key joint-password))
           (error "Incorrenct password -- MAKE_JOINT"))
          ((eq? m 'withdraw) (acc password 'withdarw))
          ((eq? m 'desposit) (acc password 'deposit))
          (else (error "Unkonw request -- MAKE_JOINT" m))))
  dispatch)