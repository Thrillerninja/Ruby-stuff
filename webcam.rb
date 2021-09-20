
include OpenCV

capture = OpenCV::CvCapture.open
sleep 1 # Warming up the webcam
capture.query.save("image.jpg")
capture.close