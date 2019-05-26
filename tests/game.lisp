(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-gol/game :cl-mock)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/game)



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
