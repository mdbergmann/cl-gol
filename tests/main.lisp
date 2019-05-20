(defpackage :cl-gol/tests/main
  (:use :cl :fiveam :cl-gol)
  (:export #:run!
           #:all-tests
           #:nil))
(in-package :cl-gol/tests/main)

;; your test code here

(test trivial
      "Trivial test"
      (is (= 1 1)))

(run! 'trivial)

