(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-gol/game)
  (:export #:run!
           #:all-tests
           #:nil))
(in-package :cl-gol/tests/game)

;; your test code here

(test trivial
      "Trivial test"
      (is (= 1 1)))

(run! 'trivial)

