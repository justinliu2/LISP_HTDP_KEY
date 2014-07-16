;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |HTDP_EX_SAMPLE4_(5.2)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct velocity (dx dy))
(define-struct ufo (location velocity))
(check-expect (ufo-move 
               (make-ufo (make-posn 22 80) (make-velocity 8 -3)))
              (make-ufo (make-posn 30 77) (make-velocity 8 -3)))
(define (ufo-move u)
  (make-ufo
   (posn+ (ufo-location u) (ufo-velocity u))
   (ufo-velocity u)))
(check-expect (posn+ (make-posn 22 80) 
                     (make-velocity 8 -3)) 
              (make-posn 30 77))
(define (posn+ p v)
  (make-posn (+ (posn-x p) (velocity-dx v))
             (+ (posn-y p) (velocity-dy v))))