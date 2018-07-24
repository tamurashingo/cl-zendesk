(in-package :cl-user)
(defpackage zendesk
  (:use :cl)
  (:export :<zendesk-connection>
           :base-url
           :auth-token
           :connect/password
           :connect/token))
(in-package :zendesk)


(defclass <zendesk-connection> ()
  ((base-url :initarg :base-url
             :accessor base-url
             :initform NIL)
   (auth-token :initarg :auth-token
               :accessor auth-token
               :initform NIL)))

(defun connect/password (base-url username password)
  (make-instance '<zendesk-connection>
                 :base-url base-url
                 :auth-token (gen-header/password username password)))

(defun connect/token (base-url username token)
  (make-instance '<zendesk-connection>
                 :base-url base-url
                 :auth-token (gen-header/token username token)))


(defun gen-header/password (username password)
  (format NIL "Basic ~A"
          (cl-base64:string-to-base64-string
           (format NIL "~A:~A" username password))))
                   
                 
(defun gen-header/token (username token)
  (format NIL "Basic ~A"
          (cl-base64:string-to-base64-string
           (format NIL "~A/token:~A" username token))))


