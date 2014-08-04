;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_45) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define height 100)
(define width 200)
(define background (empty-scene width height))
(define max-hap 100)
(define min-hap 0)
(define ratio (/ width max-hap))
(define x 100)
(define (happiness x)
  (cond
    [(> x max-hap) max-hap]
    [(< x min-hap) min-hap]
    [else x]))
(define ws (happiness x))
(define (render ws)
  (place-image (frame (rectangle width (* ws ratio) "solid" "red"))
               (/ width 2)
               (- width (/ (* ws ratio) 2))
               background))
(define (dec ws)
  (- ws 0.1))
(define (feed ws ke)
  (cond
    [(string=? "down" ke) (+ ws 1/5)]
    [(string=? "up" ke) (+ ws 1/3)]
    [else ws]))
(define (main ws)
  (big-bang ws
            [on-tick dec]
            [to-draw render]
            [on-key feed]))
            
