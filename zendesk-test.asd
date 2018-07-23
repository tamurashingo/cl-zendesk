#|
  This file is a part of cl-zendesk project.
  Copyright (c) 2018 tamura shingo (tamura.shingo@gmail.com)
|#

(in-package :cl-user)
(defpackage zendesk-test-asd
  (:use :cl :asdf))
(in-package :zendesk-test-asd)

(defsystem zendesk-test
  :author "tamura shingo"
  :license "MIT"
  :depends-on (:zendesk
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "zendesk"))))
  :description "Test system for cl-zendesk"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
