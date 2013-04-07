;;
;; Exercise 1.41
;;
;; 定義一個名稱為double的過程, 且使它的參數被調用兩次.

(define (double fn)
  (lambda (x) (fn (fn x))))

(define (inc x)  ; procedure inc
  (+ x 1))

;; 使用時: (((double (double double)) inc) 5) => 21
;; 分析:
;;  1. (double double) <=> (lambda (x) (double (double x))) 
;;     設為過程f的話, 則把inc帶入f, 就有 (inc (inc (inc (inc x))))
;
;;  2. (double (double double)) <=> (lambda (x) (f (f x)))  
;;     設為過程g的話, 則把inc帶入g, 就有: "(inc (inc ...(inc x)))"
;;     16個inc組合.
;
;;  3. ((double (double double)) inc) <=> 有16個inc組合而成的過程, 
;;     格式為: (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc 
;;     (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))))))))))
;
;;  4. (((double (double double)) inc) 5) 由式子3中的一個包含16個
;;     inc過程的過程, 轉值5進去, 則結果為21(就是5做inc 16次)
