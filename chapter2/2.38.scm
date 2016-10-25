(fold-right / 1 (list 1 2 3))
;; rst: 1 / (2 / (3 / 1))

(fold-left / 1 (list 1 2 3))
;; rst: ((1/ 1) / 2) / 3


;; (op k(i) a) == (op a k(len - i))
