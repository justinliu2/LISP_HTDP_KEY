;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |HTDP_EX_SAMPLE1_(5.4)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(check-expect (distance-to-0 (make-coodination 0 0 0)) 0)
(define-struct coodination (x y z))
(define (distance-to-0 a-coodination)
  (sqrt
   (+
    (sqr (coodination-x a-coodination))
    (sqr (coodination-y a-coodination))
    (sqr (coodination-z a-coodination)))))