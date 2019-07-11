from object_tracker import Tracker

tracker = Tracker("rtsp://10.90.131.159:554/ch0_0.h264", "CSRT")
tracker.start()

while 1:
	print(tracker.target[0], tracker.target[1])
