(defpackage :cl-gol/tests/all
  (:use :cl :fiveam :cl-mock
   :cl-gol/tests/it_game
   :cl-gol/tests/game)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/all)

