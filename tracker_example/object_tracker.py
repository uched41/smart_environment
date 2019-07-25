"""
function of this file is to track a selected object
initially, the user selects a target object to track
CSRT object tracker is used
"""
import cv2 as cv
import sys
import threading

class Tracker(threading.Thread):
	def __init__(self, ipAddress, trackerType):
		threading.Thread.__init__(self)
		self.ipAddress = ipAddress
		self.trackerType = trackerType
		self.target = [0, 0, 0, 0]

	def createTracker(self):
		tracker = cv.TrackerCSRT_create()
		return tracker

	def openVideoStream(self):
		video = cv.VideoCapture(self.ipAddress)
		if not video.isOpened():
			print ("Error: the video stream can not be opened")
			sys.exit(-1)
		else:
			return video

	def selectROI(self, frame):
		bbox = cv.selectROI(frame, False)
		return bbox

	def run(self):
		tracker = self.createTracker()
		video = self.openVideoStream()
		ok, frame = video.read()
		if not ok:
			print ("Can not read a video stream")
			sys.exit(-1)
		self.target = self.selectROI(frame)
		ok = tracker.init(frame, self.target)
		cv.destroyAllWindows()

		while True:
			ok, frame = video.read()
			if not ok:
				break
			ok, self.target = tracker.update(frame)
			if ok:
				p1 = (int(self.target[0]), int(self.target[1]))
				p2 = (int(self.target[0]+self.target[2]), int(self.target[1]+self.target[3]))
				cv.rectangle(frame, p1, p2, (0, 0, 255), 2, 1)
			else:
				cv.putText(frame, "Tracking failed", (100,80), cv.FONT_HERSHEY_SIMPLEX, 0.75, (0,0,255), 2)

			cv.imshow("Frame", frame)

			if cv.waitKey(1) & 0xFF == ord('q'):
				video.release()
				cv.destroyAllWindows()
				break

