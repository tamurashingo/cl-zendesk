(in-package :cl-user)
(defpackage cl-zendesk-asd
  (:use :cl :asdf))
(in-package :cl-zendesk-asd)

(defsystem cl-zendesk
  :version "0.1"
  :author "tamura shingo"
  :license "MIT"
  :depends-on (:zendesk))
