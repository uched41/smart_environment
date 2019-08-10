; Auto-generated. Do not edit!


(cl:in-package smartenv-srv)


;//! \htmlinclude detection-request.msg.html

(cl:defclass <detection-request> (roslisp-msg-protocol:ros-message)
  ((tag_format
    :reader tag_format
    :initarg :tag_format
    :type cl:string
    :initform "")
   (tag_id
    :reader tag_id
    :initarg :tag_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass detection-request (<detection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <detection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'detection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name smartenv-srv:<detection-request> is deprecated: use smartenv-srv:detection-request instead.")))

(cl:ensure-generic-function 'tag_format-val :lambda-list '(m))
(cl:defmethod tag_format-val ((m <detection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smartenv-srv:tag_format-val is deprecated.  Use smartenv-srv:tag_format instead.")
  (tag_format m))

(cl:ensure-generic-function 'tag_id-val :lambda-list '(m))
(cl:defmethod tag_id-val ((m <detection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smartenv-srv:tag_id-val is deprecated.  Use smartenv-srv:tag_id instead.")
  (tag_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <detection-request>) ostream)
  "Serializes a message object of type '<detection-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tag_format))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tag_format))
  (cl:let* ((signed (cl:slot-value msg 'tag_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <detection-request>) istream)
  "Deserializes a message object of type '<detection-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_format) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tag_format) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<detection-request>)))
  "Returns string type for a service object of type '<detection-request>"
  "smartenv/detectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'detection-request)))
  "Returns string type for a service object of type 'detection-request"
  "smartenv/detectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<detection-request>)))
  "Returns md5sum for a message object of type '<detection-request>"
  "bf8939a53b44d15d1f388142bf4233b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'detection-request)))
  "Returns md5sum for a message object of type 'detection-request"
  "bf8939a53b44d15d1f388142bf4233b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<detection-request>)))
  "Returns full string definition for message of type '<detection-request>"
  (cl:format cl:nil "string tag_format~%int16 tag_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'detection-request)))
  "Returns full string definition for message of type 'detection-request"
  (cl:format cl:nil "string tag_format~%int16 tag_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <detection-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tag_format))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <detection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'detection-request
    (cl:cons ':tag_format (tag_format msg))
    (cl:cons ':tag_id (tag_id msg))
))
;//! \htmlinclude detection-response.msg.html

(cl:defclass <detection-response> (roslisp-msg-protocol:ros-message)
  ((objects
    :reader objects
    :initarg :objects
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass detection-response (<detection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <detection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'detection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name smartenv-srv:<detection-response> is deprecated: use smartenv-srv:detection-response instead.")))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <detection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader smartenv-srv:objects-val is deprecated.  Use smartenv-srv:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <detection-response>) ostream)
  "Serializes a message object of type '<detection-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <detection-response>) istream)
  "Deserializes a message object of type '<detection-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<detection-response>)))
  "Returns string type for a service object of type '<detection-response>"
  "smartenv/detectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'detection-response)))
  "Returns string type for a service object of type 'detection-response"
  "smartenv/detectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<detection-response>)))
  "Returns md5sum for a message object of type '<detection-response>"
  "bf8939a53b44d15d1f388142bf4233b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'detection-response)))
  "Returns md5sum for a message object of type 'detection-response"
  "bf8939a53b44d15d1f388142bf4233b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<detection-response>)))
  "Returns full string definition for message of type '<detection-response>"
  (cl:format cl:nil "string[] objects~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'detection-response)))
  "Returns full string definition for message of type 'detection-response"
  (cl:format cl:nil "string[] objects~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <detection-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <detection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'detection-response
    (cl:cons ':objects (objects msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'detection)))
  'detection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'detection)))
  'detection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'detection)))
  "Returns string type for a service object of type '<detection>"
  "smartenv/detection")