;; Auto-generated. Do not edit!


(when (boundp 'smartenv::detection)
  (if (not (find-package "SMARTENV"))
    (make-package "SMARTENV"))
  (shadow 'detection (find-package "SMARTENV")))
(unless (find-package "SMARTENV::DETECTION")
  (make-package "SMARTENV::DETECTION"))
(unless (find-package "SMARTENV::DETECTIONREQUEST")
  (make-package "SMARTENV::DETECTIONREQUEST"))
(unless (find-package "SMARTENV::DETECTIONRESPONSE")
  (make-package "SMARTENV::DETECTIONRESPONSE"))

(in-package "ROS")





(defclass smartenv::detectionRequest
  :super ros::object
  :slots (_tag_format _tag_id ))

(defmethod smartenv::detectionRequest
  (:init
   (&key
    ((:tag_format __tag_format) "")
    ((:tag_id __tag_id) 0)
    )
   (send-super :init)
   (setq _tag_format (string __tag_format))
   (setq _tag_id (round __tag_id))
   self)
  (:tag_format
   (&optional __tag_format)
   (if __tag_format (setq _tag_format __tag_format)) _tag_format)
  (:tag_id
   (&optional __tag_id)
   (if __tag_id (setq _tag_id __tag_id)) _tag_id)
  (:serialization-length
   ()
   (+
    ;; string _tag_format
    4 (length _tag_format)
    ;; int16 _tag_id
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tag_format
       (write-long (length _tag_format) s) (princ _tag_format s)
     ;; int16 _tag_id
       (write-word _tag_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tag_format
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tag_format (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16 _tag_id
     (setq _tag_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass smartenv::detectionResponse
  :super ros::object
  :slots (_objects ))

(defmethod smartenv::detectionResponse
  (:init
   (&key
    ((:objects __objects) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _objects __objects)
   self)
  (:objects
   (&optional __objects)
   (if __objects (setq _objects __objects)) _objects)
  (:serialization-length
   ()
   (+
    ;; string[] _objects
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _objects)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _objects i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass smartenv::detection
  :super ros::object
  :slots ())

(setf (get smartenv::detection :md5sum-) "bf8939a53b44d15d1f388142bf4233b3")
(setf (get smartenv::detection :datatype-) "smartenv/detection")
(setf (get smartenv::detection :request) smartenv::detectionRequest)
(setf (get smartenv::detection :response) smartenv::detectionResponse)

(defmethod smartenv::detectionRequest
  (:response () (instance smartenv::detectionResponse :init)))

(setf (get smartenv::detectionRequest :md5sum-) "bf8939a53b44d15d1f388142bf4233b3")
(setf (get smartenv::detectionRequest :datatype-) "smartenv/detectionRequest")
(setf (get smartenv::detectionRequest :definition-)
      "string tag_format
int16 tag_id
---
string[] objects

")

(setf (get smartenv::detectionResponse :md5sum-) "bf8939a53b44d15d1f388142bf4233b3")
(setf (get smartenv::detectionResponse :datatype-) "smartenv/detectionResponse")
(setf (get smartenv::detectionResponse :definition-)
      "string tag_format
int16 tag_id
---
string[] objects

")



(provide :smartenv/detection "bf8939a53b44d15d1f388142bf4233b3")


