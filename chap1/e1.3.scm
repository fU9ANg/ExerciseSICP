
;;
;; Exercise 1.3
;;

;; 如輸入的三個數為x, y, z 則有如下幾種可能性:
;; x>y 又 y>z 則結果為(+ x y)
;; x>y 又 y<z 則結果為(+ x z)
;; x<y 又 x>z 則結果為(+ x y)
;; x<y 又 x<z 則結果為(+ y z)
;; x=y 又 x>z 則結果為(+ x y)
;; x=y 又 x<z 則結果為(+ x z)或者(+ y z)

(define maxAdd                ; 定義一個過程 (且有三個形式參數)
    (lambda (x y z)
        (cond ((> x y)
            (if (< y z) (+ x z)
                (+ x y)))
        ((< x y)
            (if (< x z) (+ y z)
                (+ x y)))
        ((= x y)
            (if (< x z) (+ x z)
                (+ x y))))))  ; 也可為(if (< x z) (+ y z) (+ x y))))))
