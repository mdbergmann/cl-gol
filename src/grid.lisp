(defpackage cl-gol/src/grid
  (:use :cl)
  (:export :neighbour-count)
  (:nicknames :grid))

(in-package :cl-gol/src/grid)

(defun neighbour-count (grid row col)
  (reduce #'+
          (list
           (get-field-value grid (- row 1) (- col 1))
           (get-field-value grid (- row 1) col)
           (get-field-value grid (- row 1) (+ col 1))
           (get-field-value grid row (- col 1))
           (get-field-value grid row (+ col 1))
           (get-field-value grid (+ row 1) (- col 1))
           (get-field-value grid (+ row 1) col)
           (get-field-value grid (+ row 1) (+ col 1)))))

(defun get-field-value (grid row col)
  (let ((max-grid-index (- (length grid) 1)))
    (if (or
         (< row 0)
         (< col 0)
         (> row max-grid-index)
         (> col max-grid-index))
        0
        (aref (aref grid row) col))))
