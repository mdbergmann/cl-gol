(defpackage :cl-gol/tests/rules
  (:use :cl :fiveam :cl-gol/src/rules)
  (:export #:run!
           #:all-tests
           #:nil))

(in-package :cl-gol/tests/rules)


(def-suite rules-tests
  :description "rules tests"
  :in cl-gol/tests/all:test-suite)

(in-suite rules-tests)

(test alivep
  (is (= (alivep 1 0) 0))
  (is (= (alivep 1 1) 0))
  (is (= (alivep 1 2) 1))
  (is (= (alivep 1 3) 1))
  (is (= (alivep 1 4) 0))
  (is (= (alivep 0 3) 1))
  (is (= (alivep 0 2) 0))
  )

(run! 'alivep)
