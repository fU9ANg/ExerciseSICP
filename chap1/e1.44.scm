;;
;; Exercise 1.44
;;
(define dx 0.0001) ; dx

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx))) 3)))

;; 使用時, 如: ((repeated (smooth square) 2) 10)
