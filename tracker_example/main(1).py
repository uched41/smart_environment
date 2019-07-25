from object_tracker import Tracker

tracker = Tracker(0, "CSRT")
tracker.start()

while 1:
	print(tracker.target[0], tracker.target[1])
