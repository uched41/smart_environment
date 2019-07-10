import cv2
import sys

#"lets make som random changes"
print("Starting")
video = cv2.VideoCapture("rtsp://10.90.131.159:554/ch0_0.h264")
if not video.isOpened():
    print("Error could not open video")
    sys.exit()

print("Video Stream found")
tracker = cv2.TrackerMOSSE_create()

ok, frame = video.read()
if not ok:
    print("Cannot read video file")
    sys.exit()

bbox = cv2.selectROI(frame, False)      # select bounding box
ok = tracker.init(frame, bbox)          # iniitialize bounding box 

def track_loop():
    print("Starting tracking loop")
    global tracker
    global video
    global ok
    global frame
    global bbox
    while True:
        ok, frame = video.read()
        if not ok:
            break

        timer = cv2.getTickCount()
        ok, bbox = tracker.update(frame)

        fps = cv2.getTickFrequency() / (cv2.getTickCount()-timer)
        if ok:      # tracking success
            p1 = (int(bbox[0]), int(bbox[1]))
            p2 = (int(bbox[0] + bbox[2]), int(bbox[1] + bbox[3]))

            cv2.rectangle(frame, p1, p2, (255, 0, 0), 2, 1)

        else:
            cv2.putText(frame, "Tracking failed")

        cv2.putText(frame,"FPS: " + str(int(fps)), (100, 50),cv2.FONT_HERSHEY_SIMPLEX, 0.75, (50,170,50), 2)

        cv2.imshow("Tracking", frame)

        k = cv2.waitKey(0) & 0xff
        if k == 27 :
            break


track_loop()
