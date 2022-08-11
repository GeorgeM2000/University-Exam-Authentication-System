# University Exam Authentication System
 A university authentication system idea that can be used for online exams.
 
# Description 
Semester online exams can take a long time because the authentication process is done by the supervisor.
During online exams a supervisor authenticates the students by checking their identification card. This process is time consuming and inefficient so i implemented an autonomous way to do that using a QR/Barcode python library.
Once the QR code is scanned a number is extracted which is the student's ID. Then, a validation check is done in the database using the student's ID. If the validation succeeds the student's can see their private information.

 
# Requirements 

### Python Libraries
- cv2
- numpy
- pyzbar
- time
### Nmp packages
- express
- path
- mysql2
- child_process

