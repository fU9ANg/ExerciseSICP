;;
;; Exercise 1.10
;;

;;Ackermann函數的scheme語言描述:
(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))

(A 1 10) ; 1024
(A 2 4)  ; 65536
(A 3 3)  ; 65536

;; 以上的練習, 在求值器中輸入即可得知, 數學替換式應該為(采用正
;; 則序):

;; (A 1 10)
;; 
;; (A 0 (A 1 9))
;; (* 2 (A 1 9))
;; (* 2 (* 2 (A 1 8)))
;; (* 2 (* 2 (* 2 (A 1 7))))
;; (* 2 (* 2 (* 2 (* 2 (A 1 6)))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 5))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 4)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 3))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 2)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1))))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
;; 1024

;; (A 2 4)
;;
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; 由上例可得: (A 1 (2^4))
;; (A 1 16)
;; 65536

;; (A 3 3)
;;
;; (A 2 (A 3 2))
;; (A 2 (A 2 (A 3 1)))
;; (A 2 (A 2 2))
;; 由上例可得: (A 2 (2^2))
;; (A 2 4)
;; 65536

(define (f n) (A 0 n))   ;; 計算的是2n
(define (g n) (A 1 n))   ;; 計算的是2^n
(define (h n) (A 2 n))   ;; 計算的是2^(2^(2^(2^(2))))... (n個)
(define (k n) (* 5 n n)) ;; 計算的是5n^2

;; 此題我們可以先思考出(A 1  n)的數學模型, 通過(A 1 n)再來思考
;; (A 2 n)的數學模型; 同理也可以思考(A 3 n)的數學模型,你可以試
;; 試求(A 2 5)的數學模型.  :-)
;; 這個函數的計算空間和步驟是太大了, 指數的指數增長.