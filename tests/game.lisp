(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-mock :cl-gol/src/game)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/game)


(def-suite game-tests
  :description "high level game tests with mocks"
  :in cl-gol/tests/all:test-suite)

(in-suite game-tests)

;; grids
(defvar *testgrid1* #(#(0 0)
                      #(0 1)))
(defvar *testgrid1_expected* #(#(0 0)
                               #(0 0)))

(defvar *testgrid2* #(#(0 0 1)
                      #(0 1 1)
                      #(0 0 0)))
(defvar *testgrid2_expected* #(#(0 1 1)
                               #(0 1 1)
                               #(0 0 0)))

(test next-gen-1
  "Tests for next-gen function"
  (with-mocks ()
    ;; rule calls
    (answer (rules:alivep 0 0) 0)
    (answer (rules:alivep 0 1) 0)
    (answer (rules:alivep 1 0) 0)

    ;; grid calls
    (answer (grid:neighbour-count *testgrid1* 0 0) 1)
    (answer (grid:neighbour-count *testgrid1* 0 1) 1)
    (answer (grid:neighbour-count *testgrid1* 1 0) 1)
    (answer (grid:neighbour-count *testgrid1* 1 1) 0)
    
    (is (equalp (game:next-gen *testgrid1*) *testgrid1_expected*))

    (is (eql (length (invocations 'rules:alivep)) 4))
    (is (eql (length (invocations 'grid:neighbour-count)) 4))))

(test next-gen-2
  "Tests for next-gen function with other grids"
  (with-mocks ()
    ;; rule calls
    (answer (rules:alivep 0 1) 0)
    (answer (rules:alivep 0 2) 0)
    (answer (rules:alivep 0 3) 1)
    (answer (rules:alivep 1 2) 1)

    ;; grid calls
    (answer (grid:neighbour-count *testgrid2* 0 0) 1)
    (answer (grid:neighbour-count *testgrid2* 0 1) 3)
    (answer (grid:neighbour-count *testgrid2* 0 2) 2)
    (answer (grid:neighbour-count *testgrid2* 1 0) 1)
    (answer (grid:neighbour-count *testgrid2* 1 1) 2)
    (answer (grid:neighbour-count *testgrid2* 1 2) 2)
    (answer (grid:neighbour-count *testgrid2* 2 0) 1)
    (answer (grid:neighbour-count *testgrid2* 2 1) 2)
    (answer (grid:neighbour-count *testgrid2* 2 2) 2)

    (is (equalp (game:next-gen *testgrid2*) *testgrid2_expected*))

    (is (eql (length (invocations 'rules:alivep)) 9))
    (is (eql (length (invocations 'grid:neighbour-count)) 9))))

;; run tests
(run! 'next-gen-1)
(run! 'next-gen-2)
