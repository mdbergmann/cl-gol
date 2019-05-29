(defsystem "cl-gol"
  :version "0.1.0"
  :author "Manfred Bergmann"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "game")
                 (:file "grid")
                 (:file "rules"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "cl-gol/tests"))))

(defsystem "cl-gol/tests"
  :author "Manfred Bergmann"
  :license ""
  :depends-on ("cl-gol"
               "fiveam"
               "cl-mock")
  :components ((:module "tests"
                :components
                ((:file "game"))))
  :description "Test system for cl-gol"

  :perform (test-op (op c) (symbol-call :fiveam :run! 'cl-gol/tests/game:all-tests)))

;; add to asdf:*central-registry* is not done
;; (push #P"~/Development/MySources/cl-gol/" asdf:*central-registry*)
;;
;; load system
;; (asdf:load-system "cl-gol")
;;
;; test system
;; (asdf:test-system "cl-gol/tests")
