;;
;; Exercise 1.28
;;
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t) ; true
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))      ; false

; 說明: 換用"Miller-Rabin"方法后, 比起"費馬檢查", 好
;       了很多; 像能夠騙過"費馬檢查"的carmichael數, 
;       不能騙過"Miller-Rabin檢查"了.
