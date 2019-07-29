#!/usr/bin/env python
# coding: utf-8

# In[2]:


import cv2
from object_detector import object_detector

# Replace dining_table.jpg with the image whose objects you want to detect
img = cv2.imread("dining_table.jpg",1)
obj = object_detector(img)
obj.process_image()

