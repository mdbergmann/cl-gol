(defpackage cl-gol/game
  (:use :cl :cl-gol/grid :cl-gol/rules)
  (:export :next-gen)
  (:nicknames :game))

(in-package :cl-gol/game)

(defun next-gen (grid)
  (let ((row_i -1))
    (map 'vector
         #'(lambda (row)
             (setf row_i (1+ row_i))
             (new-row grid row row_i))
         grid)))

(defun new-row (grid row row-index)
  (let ((col -1))
    (map 'vector #'(lambda (cell)
                     (setf col (1+ col))
                     (format t "col: ~a, " col)
                     (new-cell cell
                               col
                               row-index
                               grid)) row)))

(defun new-cell (cell cell-index row-index grid)
  (rules:alivep cell
                (grid:neighbour-count grid
                                      cell-index
                                      row-index)))
