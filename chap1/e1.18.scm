;;
;; Exercise 1.18
;;
;; 基于加, 加倍, 折半運算的迭代計算過程

(define (fast-mul a b)
    (let loop ((p-a a)
               (p-b b)
               (odd-acc 0)
               (even-acc a))
        (cond
            ((or (= p-b 0) (= p-b 1)) (+ odd-acc even-acc))
            ((even p-b) 
                (loop (double p-a) (halve p-b) odd-acc (double even-acc)))
            (else (loop p-a (- p-b 1) (+ odd-acc p-a) even-acc)))))
