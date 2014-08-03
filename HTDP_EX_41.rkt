;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_41) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define WIDTH 100)
(define HEIGHT 30)
(define MT (empty-scene WIDTH HEIGHT))
(check-expect (remember "hello" " ") "hello ")
(check-expect (remember "hello " "w") "hello w")
(define (remember ak ke)
  (string-append ak ke))
(check-expect (show "hel") (frame (text "hel" 11 "red")))
(check-expect (show "mark") 
              (frame(text "mark" 11 "red")))
(define (show ak)
  (frame (text ak 11 "red")))
(define (main s)
  (big-bang s
            [on-key remember]
            [to-draw show]))