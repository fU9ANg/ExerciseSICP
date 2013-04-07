;;
;; Exercise 1.40
;;
;; 因為過程newtons-method的第一個參數為一個過程
;; 定義一個過程cubic

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
         (* a x x)
         (* b x)
         c)))

;; 使用時: (define a -1)
;;         (define b -2)
;;         (define c -3)
;;         (newtons-method (cubic a b c) 1)
;;         => 2.374423763210693
