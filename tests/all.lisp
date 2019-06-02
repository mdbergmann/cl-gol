(defpackage :cl-gol/tests/all
  (:use :cl :fiveam)
  (:export :test-suite))

(in-package :cl-gol/tests/all)

(def-suite test-suite
    :description "The parent test suite")
