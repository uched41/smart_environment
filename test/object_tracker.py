"""
function of this file is to track a selected object
initially, the user selects a target object to track
CSRT object tracker is used
"""
import cv2 as cv
import sys

class Tracker(object):
	def __init__(self, ipAddress, trackerType):
		self.ipAddress = ipAddress
		self.trackerType = trackerType
	
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
	
	def track(self):
		tracker = self.createTracker()
		video = self.openVideoStream()
		ok, frame = video.read()
		if not ok:
			print ("Can not read a video stream")
			sys.exit(-1)
		target = self.selectROI(frame)
		ok = tracker.init(frame, target)
		cv.destroyAllWindows()

		while True:
			ok, frame = video.read()
			if not ok:
				break
			ok, target = tracker.update(frame)
			if ok:
				p1 = (int(target[0]), int(target[1]))
				p2 = (int(target[0]+target[2]), int(target[1]+target[3]))
				cv.rectangle(frame, p1, p2, (0, 0, 255), 2, 1)
			else:
				cv.putText(frame, "Tracking failed", (100,80), cv.FONT_HERSHEY_SIMPLEX, 0.75, (0,0,255), 2)
			cv.imshow("frame", frame)
			
			if cv.waitKey(1) & 0xFF == ord('q'):
				video.release()
				cv.destroyAllWindows()
				break

		
		
