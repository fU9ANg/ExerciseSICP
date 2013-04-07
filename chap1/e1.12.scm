;;
;; Exercise 1.12
;;
;; 計算第line行site列是什么數? 它等于第(line -1)行site列的數和
;; 第(line -1)行(site- 1)列的數之和; 如圖: (x=3+3=6)
;; 
;;            1
;;           1 1
;;          1 2 1
;;         1 3 3 1
;;        1 4 x 4 1
;;        ...

(define pascal
  (lambda (site line)
    (if (or (= site 1) (= site line)) 1 
        (+ (pascal (- site 1) (- line 1))
           (pascal site (- line 1))))))


;;; 下面代碼是三種對斐波那契數列的Scheme語言寫法形式

;; first-version (Recursion)
;; 一般遞歸(樹型遞歸)

(define (Fib n)
    (cond ((= n 0) 0)
      ((= n 1) 1)
      (else (+ (Fib (- n 1))
           (Fib (- n 2))))))

;; second-version
;; 迭代

(define (Fib n)
    (define Fib-iter 
        (lambda (a b count)
            (if (= count 0) b
                (Fib-iter (+ a b) a (- count 1)))))
    (Fib-iter 1 0 n))

;; third-version
;; 尾遞歸

(define (Fib n)
    (let Fib-loop ((a 1) (b 0) (count n))
        (if (= count 0) b
            (Fib-loop (+ a b) a (- count 1)))))

;; 1 1 2 3 5 8 13 21 34 55 ...
;;
;; 以上的三種寫法區別在于:
;;
;; 2和3是沒有區別的(Scheme內部);
;; 而1則每次調用時, 會重新新建一個框(包含7個內容)
;; 2和3被調用時, 內容不會生成新的框(除第一次調用時)
