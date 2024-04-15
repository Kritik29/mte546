import cv2
import numpy as np

## this script was used to determine the HSV range of the
## tennis ball in the video. The video was analyzed frame by frame
## to determine the HSV values. A subset of all video frames was used

current_frame = None

# this grabs the BGR and HSV values of the pixel that is clicked
def mouse_callback(event, x, y, flags, param):
    global current_frame
    if event == cv2.EVENT_LBUTTONDOWN and current_frame is not None:
        bgr_color = current_frame[y, x]
        hsv_color = cv2.cvtColor(np.uint8([[bgr_color]]), cv2.COLOR_BGR2HSV)
        print("BGR Color:", bgr_color)
        print("HSV Color:", hsv_color[0])

cap = cv2.VideoCapture('project/ball_color_edit.mp4')
cv2.namedWindow('Frame')
cv2.setMouseCallback('Frame', mouse_callback)

# playback the video frame by frame
paused = True

while True:
    if not paused:
        ret, current_frame = cap.read()
        if not ret:
            print("Can't receive frame (stream end?). Exiting ...")
            break
    else:
        ret, current_frame = cap.read()
        if not ret:
            print("Can't receive frame (stream end?). Exiting ...")
            break
    scale_factor = 0.5
    width = int(current_frame.shape[1] * scale_factor)
    height = int(current_frame.shape[0] * scale_factor)
    current_frame = cv2.resize(current_frame, (width, height))

    cv2.imshow('Frame', current_frame)

    key = cv2.waitKey(0)

    # HOW TO USE: spacebar unpauses/pauses the video, 'q' closes the stream
    if key == ord('q'):
        break
    elif key == 32:
        paused = not paused

cap.release()
cv2.destroyAllWindows()
