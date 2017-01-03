(define (make-hq-file division file)
  (cons divisiont file))

(define (file-division hq-file)
  (car hq-file))

(define (original-file hq-file)
  (cdr hq-file))


(define (get-record employee hq-file)
  ((get 'get-record (file-division hq-file))
   employee (original-file hq-file)))

(define (has-record? employee division)
  ((get 'has-record division) employee))

;; b)
(define (get-salary hq-file)
  ((get 'get-salary (file-division hq-file))
   (original-record hq-file)))


;; c)
(define (find-employee-record employee files)
  (cond ((null? files) (error "FIND_EMPLOYEE_RECORD : NO such emplee." employee))
        ((has-record? employee (file-division (car files)))
         (get-record employee (car files)))
        (else (find-employeee-record
               employee (cdr files)))))

;; d)
(define (install-ultra-mega-corp)
  (put 'get-record 'ultra-mega-corp ultra-mega-corp-get-record)
  (put 'has-record? 'ultra-mega-corp ultra-mega-corp-has-record?)
  (put 'get-salary 'ultra-mega-corp ultra-mega-corp-get-salary)
  )
