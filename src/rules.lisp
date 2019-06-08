(defpackage cl-gol/src/rules
  (:use :cl)
  (:export :alivep)
  (:nicknames :rules))

(in-package :cl-gol/src/rules)

(defun alivep (state neighbours)
  (cond
    ((and (= state 1) (or (= neighbours 2) (= neighbours 3))) 1)
    ((and (= state 0) (= neighbours 3)) 1)
    (t 0)))
