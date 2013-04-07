;;
;; Exercise 1.39
;;
;; 使用Lambert公式, 求tanX的值.

(define (tan-cf x k)  
  (define (fn-odd i) 
    (- (* 2 i) 1))   ; define sub-proc
  (let loop ((y x)
             (i 1))
    (cond
     ((> i k) 0)
     ((= i 1) 
      (/ y (- (fn-odd i) (loop y (+ i 1)))))
     (else 
      (/ (* y y) (- (fn-odd i) (loop y (+ i 1))))))))
