"""
apriltag detection in a real time video stream
"""
import cv2 as cv
import numpy as np
import apriltag
import sys

cap = cv.VideoCapture(0)
detector = apriltag.Detector()

while cap.isOpened():
	ret,frame = cap.read()
	frame_gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
	try:
		result = detector.detect(frame_gray)
		corners = list(result[0].corners)

		top_left = corners[0]
		bottom_right = corners[2]
		x_t,y_t = int(top_left[0]), int(top_left[1])
		x_b,y_b = int(bottom_right[0]), int(bottom_right[1])
		
	except AssertionError as e:
		print("cannt detect an apriltag")
		#sys.exit(-1)
	except IndexError as e:
		print("cannt detect an apriltag")
	else:
		print ("tag detected")
		cv.rectangle(frame, (x_t,y_t), (x_b,y_b), (255,0,0), 3)
	cv.imshow("frame", frame)

	if cv.waitKey(1) & 0xFF == ord('q'):
		break
	


cap.release()
cv.destroyAllWindows()
