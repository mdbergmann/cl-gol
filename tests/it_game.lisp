(defpackage :cl-gol/tests/it_game
  (:use :cl :fiveam :cl-mock
   :cl-gol/src/game)
  (:export #:run!
           #:nil))
(in-package :cl-gol/tests/it_game)

;; grids
(defvar *grid1* #(#(0 0 0)
                  #(0 1 0)
                  #(0 0 0)))
(defvar *grid1_expected* #(#(0 0 0)
                           #(0 0 0)
                           #(0 0 0)))

(defvar *grid2* #(#(0 0 1)
                  #(0 1 1)
                  #(0 0 0)))
(defvar *grid2_expected* #(#(0 1 1)
                           #(0 1 1)
                           #(0 0 0)))

(defvar *grid3* #(#(0 0 0)
                  #(0 1 1)
                  #(1 1 1)))
(defvar *grid3_expected* #(#(0 0 0)
                           #(1 0 1)
                           #(1 0 1)))

(defvar *grid4* #(#(0 0 1)
                  #(0 0 1)
                  #(0 0 1)))
(defvar *grid4_expected* #(#(0 0 0)
                           #(0 1 1)
                           #(0 0 0)))

;; integration tests here

(def-suite integ-tests
  :description "Integration tests"
  :in cl-gol/tests/all:test-suite)

(in-suite integ-tests)

(test sc1
  "Scenario 1"
  (is (equalp (game:next-gen *grid1*) *grid1_expected*)))

(test sc2
  "Scenario 2"
  (is (equalp (game:next-gen *grid2*) *grid2_expected*)))

(test sc3
  "Scenario 3"
  (is (equalp (game:next-gen *grid3*) *grid3_expected*)))

(test sc4
  "Scenario 4"
  (is (equalp (game:next-gen *grid4*) *grid4_expected*)))

(run! 'sc1)
(run! 'sc2)
(run! 'sc3)
(run! 'sc4)
