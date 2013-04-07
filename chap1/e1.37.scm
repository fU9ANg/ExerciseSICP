;;
;; Exercise 1.37
;;
; 迭代計算過程

(define (cont-frac n d k)     ; first-version
  (let loop ((i k)
             (temp (d k)))
    (if (= i 1) 
        (/ (n i) temp)
        (loop (- i 1) (+ (d (- i 1)) 
                         (/ (n i) temp))))))

; 遞歸計算過程

(define (cont-frac-two n d k) ; second-version
  (if (= k 0) 0
      (/ (n k) (+ (d k) (cont-frac-2 n d (- k 1))))))

; (cont-frac (labmda (i) 1.0) 
;            (lambda (i) 1.0)
;            11)
; => 0.6180555555555556
;
; 回答: 當k=11時, 具有十進制的4位精度 (0.6180...)
