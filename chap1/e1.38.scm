;;
;; Exercise 1.38
;;
(define fn-D
  (lambda (i)
    (cond
      ((= i 1) 1)
      ((= i 2) 2)
      ((= (remainder i 3) 2)
       (- i (truncate (/ i 3))))
      (else 1))))

; 使用時: 
; (cont-frac (lambda (i) 1.0) fn-D 5)
