(defsystem "cl-gol"
  :version "0.1.0"
  :author "Manfred Bergmann"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "cl-gol/tests"))))

(defsystem "cl-gol/tests"
  :author "Manfred Bergmann"
  :license ""
  :depends-on ("cl-gol"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-gol"

  :perform (test-op (op c) (symbol-call :fiveam :run! c)))
