;;
;; Exercise 1.36
;;
; 使用SICP中的1.3.3節中的fixed-point過程, 如下:

;> (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.2)
;> 4.555531964899801

; 此題也可以改為用"平均阻尼"進行, 使它可以用1.0傳入
; first-guess形參中.
