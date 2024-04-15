import cv2
import numpy as np
import matplotlib.pyplot as plt
from filterpy.kalman import KalmanFilter

# load edited video
cap = cv2.VideoCapture('project/ball_color_edit_2.mp4')

# upper and lower bounds for the tennis ball HSV mask
lower_hsv = np.array([30, 100, 80])
upper_hsv = np.array([75, 255, 170])

def setup_kalman_filter():
  # init kalman filter with 4 state vars and 2 measured vars
  kf = KalmanFilter(dim_x=4, dim_z=2)
  dt = 3
  kf.F = np.array([[1, 0, dt, 0],
                  [0, 1, 0, dt],
                  [0, 0, 1, 0],
                  [0, 0, 0, 1]])
  kf.H = np.array([[1, 0, 0, 0],
                  [0, 1, 0, 0]])
  kf.P *= 1000.
  kf.R = np.array([[1, 0],
                  [0, 1]]) * 10
  kf.Q = np.array([[1/4*dt**4, 0, 1/2*dt**3, 0],
                  [0, 1/4*dt**4, 0, 1/2*dt**3],
                  [1/2*dt**3, 0, dt**3, 0],
                  [0, 1/2*dt**3, 0, dt**3]]) * 0.1
  return kf

kf = setup_kalman_filter()
actual_positions = []
predictions = []
time_steps = []
frames = 0
paused = False

while True:
  if not paused:
    ret, frame = cap.read()
    if not ret:
      # loop the video and clear the predictions array
      cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
      predictions.clear()
      actual_positions.clear()
      continue

    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    mask = cv2.inRange(hsv, lower_hsv, upper_hsv)
    result = cv2.bitwise_and(frame, frame, mask=mask)
    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    if contours:
      largest_contour = max(contours, key=cv2.contourArea)
      (x, y), radius = cv2.minEnclosingCircle(largest_contour)
      if radius > 10:
        actual_positions.append((int(x), int(y)))
        cv2.circle(frame, (int(x), int(y)), int(radius), (0, 255, 0), 3)
        cv2.circle(frame, (int(x), int(y)), 5, (0, 0, 255), -1)
        kf.update(np.array([[x], [y]]))

    kf.predict()
    predictions.append((int(kf.x[0]), int(kf.x[1])))
    time_steps.append(frames)
    frames += 1

    for px, py in predictions:
      cv2.circle(frame, (px, py), 10, (255, 255, 255), 2)
    for i in range(1, len(actual_positions)):
      cv2.line(frame, actual_positions[i - 1], actual_positions[i], (0, 0, 255), 2)

    scale_factor = 0.5
    width = int(frame.shape[1] * scale_factor)
    height = int(frame.shape[0] * scale_factor)
    frame = cv2.resize(frame, (width, height))
    result = cv2.resize(result, (width, height))
    cv2.imshow('Frame', frame)
    # cv2.imshow('Mask', result)

  key = cv2.waitKey(50)
  if key & 0xFF == ord('q'):
    break
  elif key & 0xFF == ord('p'):
    paused = not paused

cap.release()
cv2.destroyAllWindows()

# Prepare to plot the results
fig = plt.figure(figsize=(15, 7))

# 2D plot
ax1 = fig.add_subplot(121)
actual_x, actual_y = zip(*actual_positions)
predicted_x, predicted_y = zip(*predictions)
ax1.plot(actual_x, actual_y, 'ro-', label='Actual Trajectory')
ax1.plot(predicted_x, predicted_y, 'bo-', label='Predicted Trajectory')
ax1.set_xlabel('X Position (px)')
ax1.set_ylabel('Y Position (px)')
ax1.set_title('2D Actual vs Predicted Trajectory')
ax1.legend()

# 3D plot
ax2 = fig.add_subplot(122, projection='3d')
ax2.plot(time_steps, actual_x, actual_y, label='Actual Trajectory', color='red')
ax2.plot(time_steps, predicted_x, predicted_y, label='Predicted Trajectory', color='blue')
ax2.set_xlabel('Time (frames)')
ax2.set_ylabel('X Position (px)')
ax2.set_zlabel('Y Position (px)')
ax2.set_title('3D Actual vs Predicted Trajectory')
ax2.legend()

plt.show()