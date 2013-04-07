;;
;; Exercise 1.20
;;
;; (gcd 206 40)
;; 采用正則序代換模型展開

 ;1. (gcd 40 (remainder 204 40))

 ;2. (gcd (remainder 204 40) (remainder 40 (remainder 204 40)))

 ;3. (gcd (remainder 40 (remainder 204 40))
 ;        (remainder (remainder 204 40) 
 ;                   (remaidner 40 (remainder 204 40))))

 ;4. (gcd (remainder (remainder 204 40)
 ;                   (remainder 40 (remainder 204 40)))
 ;        (remainder (remainder 40 (remainder 204 40))
 ;                   (remainder (remainder 204 40)
 ;                              (remainder 40 (remainder 204 40)))))

;; (gcd 206 40)
;; 采用應用序代模型展開
               
 ;1. (gcd 40 (remainder 204 40)) <=> (gcd 40 6)
 ;2. (gcd 6  (remainder 40  6 )) <=> (gcd 6  4)
 ;3. (gcd 4  (remainder 6   4 )) <=> (gcd 4  2)
 ;4. (gcd 2  (remainder 4   2 )) <=> (gcd 2  0)      

;; 通過以上的正則序和應用序展開則有:
;; 正則序實際執行11次remainder, 而應用序執行4次remainder.
