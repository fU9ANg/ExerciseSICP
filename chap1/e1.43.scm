;;
;; Exercise 1.43
;;
(define (repeated proc-name n)
  (lambda (x)
    (let loop ((i n)
               (proc proc-name))
      (if (= i 1) (proc x)
          (loop (- i 1) 
                (lambda (y) (proc-name (proc y))))))))

;; 說明: 先初始化proc為形參的proc-name, 然后每n-1次, 就
;;       把proc應用到proc-name函數,  這時產生一個新的函
;;       數, 再賦給proc, 直到i=1時, 返回已經做過n次處理
;;       的proc給程序員.
;; 例子: ((repeated square 2) 5) => 625
;; 又寫: ((repeated inc 12) 10)  => 22
