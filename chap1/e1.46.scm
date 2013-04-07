;;
;; Exercise 1.46
;;

(define (square n)
    (* n n))
(define (average x y)
    (/ (+ x y) 2))

;; iterative-improve

(define (iterative-improve good-enough? f)
  (lambda (x)
      (let loop ((guess x)
                 (next (f x)))
        (if (good-enough? guess next)
            next
            (loop next (f next))))))


;; 使用以上的iterative-improve過程來重新定義的1.3.3節中
;; 的 fixed-point過程

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  ((iterative-improve close-enough? f) first-guess))


;; 使用重新定義的fixed-point過程, 來定義過程my-sqrt

(define (my-sqrt-first x)
    (fixed-point (lambda (y) (average y (/ x y)))
                 1.0))

;; 使用以上的iteractive-improve過程來重新定義1.1.7節中的
;; sqrt過程

(define (my-sqrt-second x)   
  (define (good-enough? guess next)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

;; 使用如下:
(sqrt 5)          ; 這是系統提供的過程
;> 2.23606797749979
(my-sqrt-first 5)
;> 2.236067977499978
(my-sqrt-second 5)
;> 2.236067977499978
(sqrt 7)          ; 這是系統提供的過程
;> 2.6457513110645907
(my-sqrt-first 7)
;> 2.6457513110645907
(my-sqrt-second 7)
;> 2.6457513111113693
