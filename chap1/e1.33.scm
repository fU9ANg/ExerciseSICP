;;
;; Exercise 1.33
;;
;; 迭代方式實現

(define (filtered-accumulate combiner null-value 
                 predicate term a next b)
  (define (iter aa result)
    (cond 
     ((> aa b) result)
     ((predicate aa b) (iter (next aa)  ; 此處也可以寫成(predicate aa)
                                        ; 但有兩個參數的謂詞, 就有問題
                 (combiner result (term aa))))
     (else (iter (next aa) result))))
  (iter a null-value))

;; 定義好了filtered-accumulate, 則
;; 1. 對a到b區間內的素數之和

(define (prime=? n nil) ; 定義另一種形式(接收兩個參數)的過程
  (prime? n))

(define (prime-add a b)
  (filtered-accumulate + 0 prime=? + a inc b))

;; 2. 對小于n區間內的i, 所有滿足GCD(i, n)=1的整數(i<n)之積

(define (test-gcd? i n); 定義一個過程(接收兩個參數)
  (= (gcd i n) 1))

(define (gcd-add i n)
  (filtered-accumulate * 1 test-gcd? * i inc n))
