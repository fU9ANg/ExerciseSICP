;;
;; Exercise 1.42
;;
;; 參數為兩個過程f和g;  結果返回一個過程, 如題中的f(g(x))

(define (compose proc-one proc-two)
    (lambda (x) (proc-one (proc-two x))))

;; 使用時: ((compose square inc) 6) => 49
;;         ((compose inc square) 6) => 37
