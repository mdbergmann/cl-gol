(defsystem "cl-gol"
  :version "0.1.0"
  :author "Manfred Bergmann"
  :license ""
  :class :package-inferred-system
  :depends-on ("cl-gol/src/game")
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "cl-gol/tests/game"))))

(defsystem "cl-gol/tests"
  :depends-on ("cl-gol/tests/all")
  :perform (test-op (op c) (symbol-call :fiveam :run! :all-test))
  )

(register-system-packages "cl-gol/src/game" '(:game))
(register-system-packages "cl-gol/src/grid" '(:grid))
(register-system-packages "cl-gol/src/rules" '(:rules))

;; add to asdf:*central-registry* is not done
;; (push #P"~/Development/MySources/cl-gol/" asdf:*central-registry*)
;;
;; load system
;; (asdf:load-system "cl-gol")
;;
;; test system
;; (asdf:test-system "cl-gol/tests")
