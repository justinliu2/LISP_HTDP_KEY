;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_70) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(check-expect (time->seconds 
               (make-time-since-midnight 12 30 2)) 
              45002)
(define-struct time-since-midnight (hours minutes seconds))
(define (time->seconds a-time)
  (+
   (* (time-since-midnight-hours a-time) 3600)
   (* (time-since-midnight-minutes a-time) 60)
   (time-since-midnight-seconds a-time)))
