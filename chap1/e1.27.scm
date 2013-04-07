;;
;; Exercise 1.27
;;
(define (carmichael-check num)
  (let loop ((n num)
             (a 1))
    (cond 
      ((= a n) (begin (display "y")
                      (newline)))
      ((prime? n) (begin (display "n")
                         (newline)))
      ((= (expmod a n n) a) (loop n (+ a 1)))
      (else (begin (display "n")
                   (newline))))))

; 此題的思想是:滿足expmod(費馬小定理),
;              但不滿足prime?(尋找因子法)
;
; 其是可以只測試一次prime?就可以了, 可以重寫此上函數
; 如下:
(define (carmichael-check num)

  (define (expmod-check num) ; define sub-procedure
    (let loop ((n num)
               (a 1))
      (cond 
        ((= a n) #t)
        ((= (expmod a n n) a) (loop n (+ a 1)))
        (else #f))))
  
  (and (not (prime? num)) (expmod-check num)))
