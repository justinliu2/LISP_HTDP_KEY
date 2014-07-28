;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_71) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(check-expect (different 
               (make-three-letter "g" "o" "d") 
               (make-three-letter "d" "o" "g")) 
              (make-three-letter "*" "o" "*"))
(define-struct three-letter (first second third))
(define (different-letter first-letter1 first-letter2)
  (if (string=? first-letter1 first-letter2) first-letter2 "*"))
(define (different word1 word2)
  (make-three-letter
   (different-letter 
    (three-letter-first word1) (three-letter-first word2))
   (different-letter 
    (three-letter-second word1) (three-letter-second word2))
   (different-letter 
    (three-letter-third word1) (three-letter-third word2))))