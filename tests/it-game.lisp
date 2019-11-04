(defpackage :cl-gol/tests/it-game
  (:use :cl :fiveam :cl-gol/src/game)
  (:export #:run!
           #:all-tests
           #:nil))
(in-package :cl-gol/tests/it-game)

(def-suite it-game
    :description "Integration tests for Game of Life")

(in-suite it-game)

(defparameter *grid1* #(#(0 0 0)
                        #(0 1 0)
                        #(0 0 0)))
(defparameter *grid1-expected* #(#(0 0 0)
                                 #(0 0 0)
                                 #(0 0 0)))

(defparameter *grid2* #(#(0 0 1)
                        #(0 1 1)
                        #(0 0 0)))
(defparameter *grid2-expected* #(#(0 1 1)
                                 #(0 1 1)
                                 #(0 0 0)))

(defparameter *grid3* #(#(0 0 0)
                        #(0 1 1)
                        #(1 1 1)))
(defparameter *grid3-expected* #(#(0 0 0)
                                 #(1 0 1)
                                 #(1 0 1)))

(test sc1
  "Scenario 1"
  (is (equalp (game:next-gen *grid1*) *grid1-expected*)))

(test sc2
  "Scenario 2"
  (is (equalp (game:next-gen *grid2*) *grid2-expected*)))

(test sc3
  "Scenario 3"
  (is (equalp (game:next-gen *grid3*) *grid3-expected*)))

(run! 'sc1)
(run! 'sc2)
(run! 'sc3)
