;;
;; Exercise 1.30
;;
;; 迭代方式實現

(define (sum term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a)  
              (+ result (term a)))))
  (iter a 0))
