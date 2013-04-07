;;
;; Exercise 1.11
;;
;; 由題, 可知數學模型:
;; / if `n < 3' then `f(n) = n'
;; + 
;; \ if `n >=3' then `f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

(define (fn-first-version n)   ;; 用遞歸方法書寫
  (if (< n 3) n
      (+ (fn-first-version (- n 1))
         (* 2 (fn-first-version (- n 2)))
         (* 3 (fn-first-version (- n 3)))) ))

(define (tail-fn n)            ;; 用迭代方法書寫
  (let loop ((icount n)
             (acount0 0)
             (acount1 1)
             (acount2 2))
    (cond
     ((= icount 0) 0)
     ((= icount 1) 1)
     ((= icount 2) acount2)
     (else (loop (- icount 1)
              acount1
              acount2
              (+ (* 3 acount0)
                 (* 2 acount1)
                 acount2))))))

;; 理解迭代方式書寫的(tail-fn)函數, 如:
;; (tail-fn 4)
;;
;;      icount   acount0   acount1   acount2
;; loop 4        0         1         2

;; loop 3        1         2         4

;; loop 2        2         4         (+ 3 4 4)
