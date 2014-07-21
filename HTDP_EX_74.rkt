;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HTDP_EX_74) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
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
(define (string-first str)
  (substring str 0 1))
(define (string-rest str)
  (substring str 1))
(define (string-last str)
  (substring str (- (string-length str) 1)))
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))
(define (ignore? ke)
  (or  (string=? "\t" ke)
       (string=? "\u007F" ke)
       (string=? "up" ke)
       (string=? "down" ke)))
(define (backspace ed)
  (if (= (string-length (editor-pre ed)) 0)
      ed
      (make-editor (string-remove-last (editor-pre ed))
                   (editor-post ed))))
(define (move-left ed)
  (if (= (string-length (editor-pre ed)) 0)
      ed
      (make-editor (string-remove-last (editor-pre ed))
                   (string-append (string-last (editor-pre ed))
                                  (editor-post ed)))))
(define (move-right ed)
  (if (= (string-length (editor-post ed)) 0)
      ed
      (make-editor (string-append (editor-pre ed)
                                  (string-first (editor-post ed)))
                   (string-rest (editor-post ed)))))
(define (edit ed ke)
  (cond
    [(ignore? ke) ed]
    [(string=? "\b" ke) (backspace ed)]
    [(string=? "left" ke) (move-left ed)]
    [(string=? "right" ke) (move-right ed)]
    [else (make-editor (string-append (editor-pre ed) ke)
                       (editor-post ed))]))
(define (run str)
  (big-bang (make-editor string "")
            [to-draw render]
            [on-key edit]))