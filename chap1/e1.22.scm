;;
;; Exercise 1.22
;;
;; first-version

(define (my-search-for-primes num)
  (let loop((i 0)
            (n (+ num 1))
            (time (current-milliseconds)))
    (if (= i 3) (display "*** END ***")
        (begin
          (display n)
          (newline)
          (cond
           ((prime? n) (begin (display " *** ") ; prime? -> fast-prime?
                              (newline)
                              (display (- (current-milliseconds) time))
                              (newline)
                              (loop (+ i 1) (+ n 2) time)))
           (else (loop i (+ n 1) time)))) )))                                                                   

;; second-version

(define (search-for-primes num)
   (search-for-primes-iter (+ num 1) 3))

(define (search-for-primes-iter num i)
  (cond ((= 0 i)
         (begin
           (newline)
           (display "*** END ***")
           (newline)))
        ((timed-prime-test num) (search-for-primes-iter (+ 2 num)
                                                        (- i 1)))
        (else (search-for-primes-iter (+ 2 num) i))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)                ; prime? -> fast-prime? (1.24)
      (report-prime (- (current-milliseconds) start-time))
      #f))  ; 添加一個返回值 #f                                                                                               

(define (report-prime elapsed-time)
  (display " *** ")
  (newline)
  (display elapsed-time)
  (newline)
  #t)       ; 添加一個返回值 #t 

;; 關于是不是√n, 等學習了c的scheme混合編程, 那時再寫一個runtime
;; 來進行做測試, 你可以去試試.
