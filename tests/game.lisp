(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-gol/game :cl-gol/grid :cl-gol/rules :cl-mock)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/game)

(run! 'next-gen)

;; the suite
(def-suite all-tests)

(in-suite all-tests)

;; grids
(defvar *testgrid* #(#(0 0)
                     #(0 1)))
(defvar *testgrid_expected* #(#(0 0)
                              #(0 0)))

(test next-gen
  "Tests for next-gen function"
  (with-mocks ()
    ;; general rules
    (answer (rules:alivep 0 0) 0)
    (answer (rules:alivep 0 1) 0)
    (answer (rules:alivep 1 0) 0)

    ;; grid calls
    (answer (grid:neighbour-count *testgrid* 0 0) 1)
    (answer (grid:neighbour-count *testgrid* 0 1) 1)
    (answer (grid:neighbour-count *testgrid* 1 0) 1)
    (answer (grid:neighbour-count *testgrid* 1 1) 0)
    
    (is (equalp (game:next-gen *testgrid*) *testgrid_expected*))

    (is (eql (length (invocations 'rules:alivep)) 4))
    (is (eql (length (invocations 'grid:neighbour-count)) 4))
    ))
