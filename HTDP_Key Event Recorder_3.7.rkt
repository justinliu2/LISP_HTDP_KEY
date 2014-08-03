;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |HTDP_Key Event Recorder_3.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define WIDTH 100)
(define HEIGHT 30)
(define MT (empty-scene WIDTH HEIGHT))
(check-expect (remember "hello" " ") "hello ")
(check-expect (remember "hello " "w") "hello w")
(define (remember ak ke)
  (string-append ak ke))
(check-expect (show "hel") (overlay (text "hel" 11 "red") MT))
(check-expect (show "mark") (overlay (text "mark" 11 "red") MT))
(define (show ak)
  (overlay (text ak 11 "red") MT))
(define (main s)
  (big-bang s
            [on-key remember]
            [to-draw show]))