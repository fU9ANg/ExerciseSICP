;;
;; Exercise 1.9
;;
;; 例如: (+ 4 5)

(define (inc n)
    (+ n 1))
(define (dec n)
    (- n 1))

;; 第一過程實現為"線性遞歸", 如采用"應用序"展開
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; 如求值器采用"正則序"展開, 則為
(inc (+ (dec 4) 5))
(inc (inc (+ (dec (dec 4)) 5)))
(inc (inc (inc (+ (dec (dec (dec 4))) 5))))
(inc (inc (inc (inc (+ (dec (dec (dec (dec 4)))) 5)))))
(inc (inc (inc (inc (+ (dec (dec (dec 3))) 5)))))
(inc (inc (inc (inc (+ (dec (dec 2)) 5)))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; 第二種過程實現為"迭代", 展開為
(+ (dec 4) (inc 5))
(+ (dec 3) (inc 6))
(+ (dec 2) (inc 7))
(+ (dec 1) (inc 8))
(inc 8)
9
