
(cl:in-package :asdf)

(defsystem "smartenv-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "detection" :depends-on ("_package_detection"))
    (:file "_package_detection" :depends-on ("_package"))
  ))