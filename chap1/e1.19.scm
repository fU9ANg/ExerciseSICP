;;
;; Exercise 1.19
;;
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))   ; compute p'
                   (+ (* q q) (* 2 p q)) ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p 
                        q
                        (- count 1)))))

; 如果以上代碼成立的話, 則:

; 1. 設count=2 和 代碼不進入even?,而直接進入else中,有:
; count=2時, a'=bq+aq+ap, b'=bp+aq
; count=1時, a''=b'q+a'q+a'p, b''=b'p+a'q   (1)
;
; 2. 設count=2 和 代碼先進入even?,后進入else, 則:
; count=2時, 設p'為計算出來的p 和 設q'為計算出來的q
; count=1時, a'=bq'+aq'+ap', b'=bp'+aq'     (2)
;
; 以上的(1)式和(2)式相同, 則有:
;
; b'q+a'q+a'p = bq'+aq'+ap' 
; 由a' = bq+aq+ap和b' = bp+aq 有如下:
; (bp+aq)q+(bq+aq+ap)q+(bq+aq+ap)p = bq'+aq'+ap'
; 又由a=1和b=0 有如下:
; aq^2+aq^2+apq+aqp+ap^2 = q'+p'
; 2aq^2+2apq+ap^2 = q'+p'                   
; 2q^2+2pq+p^2 = q'+p'                      (3)
; 
; b'p+a'q=bp'+aq'
; 由b' = bp+aq 和 a' = bq+aq+ap 有如下:
; (bp+aq)p+(bq+aq+ap)q=bp'+aq'
; 又由a=1和b=0 有如下:
; aqp+aq^2+apq=aq'
; 2apq+aq^2 = q'                            
; 2pq+q^2   = q'                            (4)
;
; 由(3)和(4)式, 則有:
; p'= p^2 + q^2
; q'= q^2 + 2qp
