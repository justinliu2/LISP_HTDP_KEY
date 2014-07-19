;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_72) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define-struct editor (pre post))
(define backgroud (empty-scene 200 20))
(define cursor (rectangle 1 20 "solid" "red"))
(define (make-text str)
  (text str 11 'black))
(define (render editor)
  (overlay/align "left" "center"
                 (beside (make-text (editor-pre editor))
                         cursor
                         (make-text (editor-post editor)))
                 (empty-scene 200 20)))