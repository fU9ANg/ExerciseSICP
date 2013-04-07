;;
;; Exercise 1.8
;;
;; 使用牛頓立方根公式: ((x ÷ y^2) + 2×y) ÷ 3
;; 以下為塊結構定義cube

(define (cube x)
    (define (cube-iter guess x)
        (if (good-enough? guess x) (exact->inexact guess)
            (cube-iter (improve guess x) x)))

  ;; 此外的good-enough?也可以改為1.7中的"檢測一次迭代
  ;; 到下一次迭代的變化情況" 的想法來寫good-enough?的
  ;; 邏輯.

  (define (good-enough? guess x)
    (< (abs (- (* guess guess guess) x)) 0.001))

  (define (improve guess x)
    (average (+ guess guess) (/ x (* guess guess))))

  (define (average x y)
    (/ (+ x y) 2))

  (cube-iter 1 x))
