// Auto-generated. Do not edit!

// (in-package smartenv.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class detectionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tag_format = null;
      this.tag_id = null;
    }
    else {
      if (initObj.hasOwnProperty('tag_format')) {
        this.tag_format = initObj.tag_format
      }
      else {
        this.tag_format = '';
      }
      if (initObj.hasOwnProperty('tag_id')) {
        this.tag_id = initObj.tag_id
      }
      else {
        this.tag_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type detectionRequest
    // Serialize message field [tag_format]
    bufferOffset = _serializer.string(obj.tag_format, buffer, bufferOffset);
    // Serialize message field [tag_id]
    bufferOffset = _serializer.int16(obj.tag_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type detectionRequest
    let len;
    let data = new detectionRequest(null);
    // Deserialize message field [tag_format]
    data.tag_format = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [tag_id]
    data.tag_id = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.tag_format.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'smartenv/detectionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b71f447056ec542b35be2048c23f5b7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string tag_format
    int16 tag_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new detectionRequest(null);
    if (msg.tag_format !== undefined) {
      resolved.tag_format = msg.tag_format;
    }
    else {
      resolved.tag_format = ''
    }

    if (msg.tag_id !== undefined) {
      resolved.tag_id = msg.tag_id;
    }
    else {
      resolved.tag_id = 0
    }

    return resolved;
    }
};

class detectionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.objects = null;
    }
    else {
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type detectionResponse
    // Serialize message field [objects]
    bufferOffset = _arraySerializer.string(obj.objects, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type detectionResponse
    let len;
    let data = new detectionResponse(null);
    // Deserialize message field [objects]
    data.objects = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.objects.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'smartenv/detectionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39d6292ea712a13252ebdb5470ba0086';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] objects
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new detectionResponse(null);
    if (msg.objects !== undefined) {
      resolved.objects = msg.objects;
    }
    else {
      resolved.objects = []
    }

    return resolved;
    }
};

module.exports = {
  Request: detectionRequest,
  Response: detectionResponse,
  md5sum() { return 'bf8939a53b44d15d1f388142bf4233b3'; },
  datatype() { return 'smartenv/detection'; }
};
