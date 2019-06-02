(defpackage :cl-gol/tests/grid
  (:use :cl :fiveam :cl-gol/src/grid)
  (:export #:run!
           #:nil))

(in-package :cl-gol/tests/grid)


(def-suite grid-tests
  :description "grid tests"
  :in cl-gol/tests/all:test-suite)

(in-suite grid-tests)

;; grids
(defvar *testgrid1* #(#(0 1)
                      #(1 1)))
(defvar *testgrid2* #(#(1 1)
                      #(0 0)))


(test neighbour-count-1
  (is (eql (grid:neighbour-count *testgrid1* 0 0) 3))
  (is (eql (grid:neighbour-count *testgrid1* 0 1) 2))
  (is (eql (grid:neighbour-count *testgrid1* 1 0) 2))
  (is (eql (grid:neighbour-count *testgrid1* 1 1) 2)))

(test neighbour-count-2
  (is (eql (grid:neighbour-count *testgrid2* 0 0) 1))
  (is (eql (grid:neighbour-count *testgrid2* 0 1) 1))
  (is (eql (grid:neighbour-count *testgrid2* 1 0) 2))
  (is (eql (grid:neighbour-count *testgrid2* 1 1) 2)))

(run! 'neighbour-count-1)
(run! 'neighbour-count-2)
