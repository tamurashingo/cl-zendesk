(in-package :cl-user)
(defpackage zendesk-test
  (:use :cl
        :zendesk
        :prove))
(in-package :zendesk-test)

;; NOTE: To run this test file, execute `(asdf:test-system :zendesk)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
