;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |HTDP_Mouse Event Recorder_3.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define MT (empty-scene 100 100))
(check-expect
 (clack MT 10 20 "something mousy")
 (place-image (circle 1 "solid" "red") 10 20 MT))
(check-expect
 (clack (place-image (circle 1 "solid" "red") 1 2 MT) 3 3 "")
 (place-image (circle 1 "solid" "red") 3 3
              (place-image (circle 1 "solid" "red") 1 2 MT)))
(define (clack ws x y action)
  (place-image (circle 1 "solid" "red") x y ws))
(check-expect (show MT) MT)
(define (show ws)
  ws)
(define (do-nothing ws) ws)
(define (main duration)
  (big-bang MT
            [to-draw show]
            [on-tick do-nothing 1 duration]
            [on-mouse clack]))
