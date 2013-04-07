;;
;; Exercise 1.17
;;
;; 使用尾遞歸實現

(define (fast-mul a b)
    (cond 
        ((= b 0) 0)
        ((even b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))
