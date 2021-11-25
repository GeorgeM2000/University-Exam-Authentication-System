import cv2
import numpy as np
from pyzbar.pyzbar import decode 
import time


def qr_code_reader():

    video = cv2.VideoCapture(0)

    # Set video width and height
    video.set(3, 580)
    video.set(4, 480)

    valid_data = False
    data = None

    # Timer control variables
    qr_code_detected = False
    timer_initiated = False
    start_timer = 0.0

    while True:
        ret, frame = video.read()

        for qr_image in decode(frame):

            # Read the data extracted from the QR image
            data = qr_image.data.decode("utf-8")

            # Get the position of the QR image
            # Convert it into a numpy array
            # Set the type to integer 32
            points = np.array([qr_image.polygon], np.int32)
            points = points.reshape((-1,1,2))

            # Draw a shape around the QR image
            cv2.polylines(frame, [points], True, (255,0,255), 5)

        # If QR image is detected, which means that variable 'data' is not none
        # Start timer and wait 3 seconds before quiting
        if data != None and not qr_code_detected:
            print("d")
            qr_code_detected = True
            start_timer = time.time()
            timer_initiated = True
        # Otherwise if no QR image is detected wait 10 seconds before quiting
        elif data == None and not qr_code_detected and start_timer == 0.0:
            print("g")
            start_timer = time.time()
            timer_initiated = True

        # Quit after 3 seconds
        if timer_initiated and (time.time() - start_timer) > 3.0 and qr_code_detected:
            valid_data = True
            break
        # Quit after 10 seconds
        elif timer_initiated and (time.time() - start_timer) > 10.0 and not qr_code_detected:
            break

        cv2.imshow("QR Code", frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    
    if valid_data:
        print(data)
    else:
        print("False")

    video.release()
    cv2.destroyAllWindows()



qr_code_reader()