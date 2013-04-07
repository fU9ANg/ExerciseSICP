;;
;; Exercise 1.31
;;
;; first-version 以遞歸方式

(define (product term a next b)
  (if (> a b) 1
      (* (term a)
     (product term (next a) next b))))

;; second-version 以迭代方式

(define (product term a next b)        
  (define (iter a result)
    (if (> a b) result
    (iter (next a) (* result (term a)))))
  (iter a 1))

;; 用以上的product來定義factorial

(define (factorial n)
  (product * 1 inc n))

;; 按照練習1.31所提的公式(John Wallis)和product求π

(define (test-pi n)
  (define (inc2 n) (+ n 2))
  (if (even? n)
      (exact->inexact 
       (* 4 (/ (* (product * 2 inc2 n)
          (product * 4 inc2 (- n 2)))
           (* (product * 3 inc2 (- n 1))
          (product * 3 inc2 (- n 1))))))
      
      (exact->inexact 
       (* 4 (/ (* (product * 2 inc2 (+ n 1))
          (product * 4 inc2 (- n 1)))
           (* (product * 3 inc2 n)
          (product * 3 inc2 n))))) ))
