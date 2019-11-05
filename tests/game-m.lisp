(defpackage :cl-gol/tests/game
  (:use :cl :fiveam :cl-mock :cl-gol/src/game)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/game)


(test test-1
  "Some test comment"
  (with-mocks ()
    ;; rule calls
    (answer (rules:alivep 0 0) 0)
    (is (eql (length (invocations 'rules:alivep)) 4))))

;; run tests
(run! 'test-1)
