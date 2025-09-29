use hospital;

#TASK-5
#INNER JOIN --> SHOW APPOINTMENTS WITH DOCTOR AND PATIENT DETAILS
SELECT a.AppointmentID, p.Name, d.Name, a.AppointmentDate
FROM appointments a
INNER JOIN patients p ON a.PatientID = p.PatientID
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID;

#LEFT JOIN --> SHOW ALL PATIENTS AND THEIR APPOINTMENTS 
SELECT p.Name, a.AppointmentDate
FROM patients p
LEFT JOIN appointments a ON p.PatientID = a.PatientID;

#RIGHT JOIN --> SHOW ALL DOCTORS AND THEIR APPOINTMENTS
SELECT d.Name, a.AppointmentDate
FROM appointments a
RIGHT JOIN Doctors d ON a.DoctorID = d.DoctorID;

#FULL JOIN --> SHOW ALL PATIENTS AND DOCTORS WITH APPOINTMENTS
#IN MySQL, THERE'S NO DIRECT FULL JOIN, TO SIMULATE A FULL JOIN, WE USE A UNION OF LEFT JOIN AND RIGHT JOIN
-- FULL JOIN using UNION of LEFT + RIGHT
SELECT p.Name, d.Name, a.AppointmentDate
FROM patients p
LEFT JOIN appointments a ON p.PatientID = a.PatientID
LEFT JOIN Doctors d ON a.DoctorID = d.DoctorID

UNION

SELECT p.Name, d.Name, a.AppointmentDate
FROM patients p
RIGHT JOIN appointments a ON p.PatientID = a.PatientID
RIGHT JOIN Doctors d ON a.DoctorID = d.DoctorID;

#CROSS JOIN --> IT LISTS ALL POSSIBLE COMBINATIONS OF PATIENTS AND DOCTORS
SELECT p.Name, d.Name
FROM patients p
CROSS JOIN Doctors d;
