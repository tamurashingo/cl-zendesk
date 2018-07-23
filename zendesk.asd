#|
  This file is a part of cl-zendesk project.
  Copyright (c) 2018 tamura shingo (tamura.shingo@gmail.com)
|#

#|
  Author: tamura shingo (tamura.shingo@gmail.com)
|#

(in-package :cl-user)
(defpackage zendesk-asd
  (:use :cl :asdf))
(in-package :zendesk-asd)

(defsystem zendesk
  :version "0.1"
  :author "tamura shingo"
  :license "MIT"
  :depends-on (:cl-base64
               :dexador)
  :components ((:module "src"
                :components
                ((:file "zendesk"))))
  :description "Common Lisp Zendesk API Client"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op zendesk-test))))
