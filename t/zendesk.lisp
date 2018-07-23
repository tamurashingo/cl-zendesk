(in-package :cl-user)
(defpackage zendesk-test
  (:use :cl
        :zendesk
        :prove))
(in-package :zendesk-test)

;; NOTE: To run this test file, execute `(asdf:test-system :zendesk)' in your Lisp.

(plan nil)


;; connect/password
(let ((conn (connect/password "https://obscura.zendesk.com"
                              "jdoe@example.com"
                              "pa$$w0rd")))
  (is-type conn '<zendesk>)
  (is (base-url conn) "https://obscura.zendesk.com")
  (is (auth-token conn) "Basic amRvZUBleGFtcGxlLmNvbTpwYSQkdzByZA=="))

;; connect/token
(let ((conn (connect/token "https://obscura.zendesk.com"
                           "jdoe@example.com"
                           "6wiIBWbGkBMo1mRDMuVwkw1EPsNkeUj95PIz2akv")))
  (is-type conn '<zendesk>)
  (is (base-url conn) "https://obscura.zendesk.com")
  (is (auth-token conn) "Basic amRvZUBleGFtcGxlLmNvbS90b2tlbjo2d2lJQldiR2tCTW8xbVJETXVWd2t3MUVQc05rZVVqOTVQSXoyYWt2"))


(finalize)
