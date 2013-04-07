;;
;; Exercise 1.32
;;
;; 遞歸方式

(define (accumulate combiner null-value term a next b)
    (if (> a b) null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

;; 迭代方式

(define (accumulate combiner null-value term a next b)
  (define (iter aa result)
    (if (> aa b) result
        (iter (next aa) (combiner result (term aa)))))
  (iter a null-value))

;; 用以上對accumulate的實現來定義sum和product
;; 1. 定義sum

(define (sum term a next b)
  (accumulate + 0 term a next b))

;; 2. 定義product

(define (product term a next b)
  (accumulate * 1 term a next b))
