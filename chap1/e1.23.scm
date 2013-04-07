;;
;; Exercise 1.23
;;
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        ((not (divides? test-divisor 2)) 
     (find-divisor n (+ test-divisor 2))) ; (next test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (next test-divisor)
  (if (= test-divisor 2) 3
      (+ test-divisor 2)))

; 關于問題回答, 等學習了c和scheme的混編后, 重寫runtime, 再作回答
