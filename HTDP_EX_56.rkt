;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_56) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define first-interval 1000)
(define second-interval 10000)
(define first-tax 0.0525)
(define second-tax 0.08)
(define (sale-tax price)
  (cond
    [(< price first-interval) 0]
    [(< price second-interval) (* price first-tax)]
    [else (* price second-tax)]))
(check-expect (sale-tax 500) 0)
(check-expect (sale-tax 1000) (* 0.0525 1000))
(check-expect (sale-tax 12000) (* 0.08 12000))
