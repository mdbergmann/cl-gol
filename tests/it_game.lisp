(defpackage :cl-gol/tests/it_game
  (:use :cl :fiveam :cl-mock :cl-gol/src/game)
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

;; integration tests here

(test sc1
  "Scenario 1"
  (is (equalp (game:next-gen *grid1*) *grid1_expected*)))

(run! 'sc1)

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
