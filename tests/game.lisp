(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-gol/game :cl-gol/grid :cl-gol/rules :cl-mock)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/game)

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
        (answer (rules:alivep 0 2) 0)
        (answer (rules:alivep 0 3) 1)
        (answer (rules:alivep 1 0) 0)
        (answer (rules:alivep 1 1) 0)
        (answer (rules:alivep 1 2) 1)
        (answer (rules:alivep 1 3) 1)

        ;; grid calls
        (answer (grid:neighbour-count *testgrid* 0 0) 1)
        (answer (grid:neighbour-count *testgrid* 0 1) 1)
        (answer (grid:neighbour-count *testgrid* 1 0) 1)
        (answer (grid:neighbour-count *testgrid* 1 1) 1)
        
        (is (equalp (game:next-gen *testgrid*) *testgrid_expected*))))

(run! 'next-gen)

;; (test trivial
;;   "Trivial test"
;;   (is (= 1 1)))

;; (test nomock
;;   "Test without mock"
;;   (is (equal (foo) "Hello")))

;; (test mocktest
;;   "Tests cl-mocks"
;;   (with-mocks ()
;;     (answer (foo) "World")

;;     (is (equal (foo) "World"))))


;; (run! 'trivial)
;; (run! 'mocktest)
;; (run! 'nomock)
