;;
;; Exercise 1.7
;;
;; 在此為實現"監視猜測值在一次迭代到下一次迭代的變化情況"(按照
;; 1.7題中的提示), 主要是改進good-enough, 我的改進過程名為good
;; -enough-second.

(define (sqrt-iter-second guess x)
  (let loop ((p-x x)
             (p-guess guess)
             (temp (improve-second guess x)))
    (if (good-enough-second? p-guess temp)
        (exact->inexact temp)
        (loop p-x temp
              (improve-second temp p-x)))))

(define (improve-second guess x)
  (average-second guess (/ x guess)))

(define (average-second x y)
  (/ (+ x y) 2))

(define (good-enough-second? guess-one guess-two)
  (< (abs (- guess-one guess-two)) 0.001))
