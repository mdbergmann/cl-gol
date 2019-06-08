(defpackage :cl-gol/src/game-visu
  (:use :cl :trivial-gamekit :cl-gol/src/game))

(in-package :cl-gol/src/game-visu)

(defvar *canvas-grid-size* 800)

(defvar *white* (gamekit:vec4 0 0 0 0))
(defvar *black* (gamekit:vec4 0 0 0 1))

(defvar *blinker* #(#(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 1 1 1 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)))

(defvar *toad* #(#(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 1 1 1 0 0 0 0 0)
                 #(0 1 1 1 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)))

(defvar *glider* #(#(0 0 0 1 0 0 0 0 0 0)
                   #(0 0 0 0 1 0 0 0 0 0)
                   #(0 0 1 1 1 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)))


(defvar *grid* *blinker*)

(defun make-point (x y)
  (gamekit:vec2 x y))

(defgame gol-visu () ()
  (:viewport-width *canvas-grid-size*)
  (:viewport-height *canvas-grid-size*)
  (:viewport-title "Game of Life")
  (:draw-rate 2)
  (:act-rate 2))

(defmethod gamekit:draw ((this gol-visu))
  ;;(format t "drawing...~%")

  (let* ((grid-size (length *grid*))
         (cell-size (/ *canvas-grid-size* grid-size)))
    ;;(format t "cell-size:~a~%" cell-size)
    (dotimes (row grid-size t)
      (dotimes (col grid-size t)
        (let* ((x (* cell-size row))
               (y (* cell-size col))
               (cell (aref (aref *grid* row) col))
               (fill-col (if (= cell 0) *white* *black*)))
          (gamekit:draw-rect
           (make-point (+ x 1) (+ y 1))
           (- cell-size 1)
           (- cell-size 1)
           :fill-paint fill-col)))))
  (setf *grid* (game:next-gen *grid*)))
