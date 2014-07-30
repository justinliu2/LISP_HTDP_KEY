;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_SAMPLE-PROBLEM_3.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE 
  (* WHEEL-RADIUS 6))
(define WHEEL 
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE 
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR
  (above
   (rectangle 
    (* 2 WHEEL-DISTANCE) 
    (* 2 WHEEL-RADIUS) 
    "solid" 
    "red")
   BOTH-WHEELS))
(define (render ws)
  (place-image CAR ws (image-height CAR) (empty-scene 400 30)))
(define (tock ws)
  (+ ws 3))
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))