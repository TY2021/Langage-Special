; 2乗との2乗の和を返す
(define (double-square x1 x2)
  (square-add (lambda (y) (* y y)) x1 x2))

; (lambda (y) (* y y))にfunと名前を付ける
(define (square-add fun x1 x2)
  (+ (fun x1) (fun x2)))
