-- 1>List all patients with their name, age, gender, and phone number.
SELECT Name, Age, Gender, Phone
FROM patients;
-- 2>List all doctors with their name and specialization.
SELECT Name, Specialization
FROM Doctors;
-- 3>Show all appointments scheduled for today.
SELECT * FROM Appointments
WHERE AppointmentDate = CURDATE();
-- 4>Find the total number of patients in the system.
SELECT COUNT(*) AS TotalPatients
FROM Patients;
-- 5>Find the total number of doctors in the hospital.
SELECT COUNT(*) AS TotalDoctors
FROM Doctors;
-- 6>List all bills with status 'Paid'.
SELECT * FROM bills
WHERE Status='Paid';
-- 7>List all bills with status 'Unpaid'.
SELECT * FROM Bills
WHERE Status= 'Unpaid';
-- 8>Display all medications prescribed to patient named 'Amit'.
SELECT m.MedicationName
FROM Patients p
JOIN Prescriptions pr
ON p.PatientID = pr.PatientID
JOIN Medications m
ON pr.MedicationID = m.MedicationID
WHERE p.Name = 'Amit';
-- 9>Retrieve the details of doctors who specialize in 'Orthopedics'.
SELECT * FROM Doctors
WHERE Specialization='Orthopedics';
-- 10>List the names of patients older than 60.
SELECT name
FROM patients
WHERE Age > 60;
-- 11>Show all appointments for doctor named 'Dr. Sharma'.
SELECT a.*
FROM Appointments a
JOIN Doctors d
ON a.DoctorID=d.DoctorID
WHERE d.Name='Dr. Sharma';
-- 12>Show the phone numbers of patients who had appointments in the last 7 days.
SELECT DISTINCT p.Phone
FROM Patients p
JOIN Appointments a
ON p.PatientID=a.PatientID
WHERE a.AppointmentDate >= CURDATE()-INTERVAL 7 DAY;
-- 13>Find all appointments that were cancelled.
SELECT * FROM Appointments
WHERE Status='Cancelled';
-- 14>Show all unique specializations available in the hospital.
SELECT DISTINCT Specialization
FROM Doctors;
-- 15>List patients who live in a specific city (e.g., 'Mumbai').
SELECT * FROM patients
WHERE City = 'Mumbai';
-- #Intermediate Level Queries# --
-- 16>Count the number of appointments each doctor has had.
SELECT d.Name, COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
JOIN Appointments a
ON d.DoctorID = a.DoctorID
GROUP BY d.Name;
-- 17>Find the number of appointments made by each patient.
SELECT p.Name, COUNT(a.AppointmentID) AS TotalAppointments
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
GROUP BY p.Name;
-- 18>Calculate the total amount billed to each patient.
SELECT p.Name, SUM(b.Amount) AS TotalBill
FROM Patients p
JOIN Bills b
ON p.PatientID = b.PatientID
GROUP BY p.Name;
-- 19>List all doctors who have more than 5 appointments.
SELECT d.Name, COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
JOIN Appointments a
ON d.DoctorID = a.DoctorID
GROUP BY d.Name
HAVING COUNT(a.AppointmentID) > 5;
-- 20>Show the patients who have been prescribed more than 2 medications.
SELECT p.Name, COUNT(pr.MedicationID) AS TotalMedications
FROM Patients p
JOIN Prescriptions pr
ON p.PatientID = pr.PatientID
GROUP BY p.Name
HAVING COUNT(pr.MedicationID) > 2;
-- 21>Retrieve the latest appointment for each patient.
SELECT PatientID, MAX(AppointmentDate) AS LatestAppointment
FROM Appointments
GROUP BY PatientID;
-- 22>Display patients who have unpaid bills greater than Rs.10,000.
SELECT p.Name, b.Amount
FROM Patients p
JOIN Bills b
ON p.PatientID = b.PatientID
WHERE b.Status='Unpaid'
AND b.Amount > 10000;
-- 23>List patients who have had appointments with more than one doctor.
SELECT p.Name
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
GROUP BY p.Name
HAVING COUNT(DISTINCT a.DoctorID) > 1;
-- 24>Show all patients who don't have any upcoming appointments.
SELECT Name
FROM Patients
WHERE PatientID NOT IN (
SELECT PatientID
FROM Appointments
WHERE Status='Scheduled'
);
-- 25>Find the total revenue generated in the current month.
SELECT SUM(Amount) AS TotalRevenue
FROM Bills
WHERE MONTH(BillDate)=MONTH(CURDATE())
AND YEAR(BillDate)=YEAR(CURDATE())
AND Status='Paid';
-- 26>Show the number of medications prescribed to each patient.
SELECT p.Name, COUNT(pr.MedicationID) AS TotalMedications
FROM Patients p
JOIN Prescriptions pr
ON p.PatientID = pr.PatientID
GROUP BY p.Name;
-- 27>List all patients who were treated by doctors specialized in 'Dermatology'.
SELECT p.Name
FROM Patients p
JOIN Appointments a
ON p.PatientID=a.PatientID
JOIN Doctors d
ON a.DoctorID=d.DoctorID
WHERE d.Specialization='Dermatology';
-- 28>Show appointments grouped by their status (Scheduled, Completed, Cancelled).
SELECT Status, COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY Status;
-- 29>Display the average bill amount for each patient.
SELECT p.Name, AVG(b.Amount) AS AverageBill
FROM Patients p
JOIN Bills b
ON p.PatientID=b.PatientID
GROUP BY p.Name;
-- 30>Find doctors who have not had any appointments in the past 30 days.
SELECT Name
FROM Doctors
WHERE DoctorID NOT IN (
SELECT DoctorID
FROM Appointments
WHERE AppointmentDate >= CURDATE() - INTERVAL 30 DAY
);
-- #Advanced Level Queries# --
-- 31>Find the top 3 doctors with the most completed appointments.
SELECT d.Name, COUNT(a.AppointmentID) AS TotalCompletedAppointments
FROM Doctors d
JOIN Appointments a
ON d.DoctorID = a.DoctorID
WHERE a.Status = 'Completed'
GROUP BY d.Name
ORDER BY TotalCompletedAppointments DESC
LIMIT 3;
-- 32>List patients who have visited doctors of more than one specialization.
SELECT p.Name
FROM Patients p
JOIN Appointments a
ON p.PatientID = a.PatientID
JOIN Doctors d
ON a.DoctorID = d.DoctorID
GROUP BY p.Name
HAVING COUNT(DISTINCT d.Specialization) > 1;
-- 33>Generate a monthly report of total billed and paid amounts.
SELECT MONTH(BillDate) AS Month, SUM(Amount) AS TotalBilled,
SUM(CASE
WHEN Status='Paid'
THEN Amount
ELSE 0
END) AS TotalPaid
FROM Bills
GROUP BY MONTH(BillDate);
-- 34>Identify patients who have never had an appointment.
SELECT Name
FROM Patients
WHERE PatientID NOT IN (
SELECT PatientID
FROM Appointments
);
-- 35>Identify patients who have never been prescribed any medication.
SELECT Name
FROM Patients
WHERE PatientID NOT IN (
SELECT PatientID
FROM Prescriptions
);
-- 36>Show patients with total unpaid bills exceeding Rs.50,000.
SELECT p.Name, SUM(b.Amount) AS TotalUnpaid
FROM Patients p
JOIN Bills b
ON p.PatientID=b.PatientID
WHERE b.Status='Unpaid'
GROUP BY p.Name
HAVING SUM(b.Amount) > 50000;
-- 37>Display the doctor who has treated the most unique patients.
SELECT d.Name, COUNT(DISTINCT a.PatientID) AS TotalPatients
FROM Doctors d
JOIN Appointments a
ON d.DoctorID=a.DoctorID
GROUP BY d.Name
ORDER BY TotalPatients DESC
LIMIT 1;
-- 38>List patients who had appointments on consecutive days.
SELECT DISTINCT p.Name
FROM Patients p
JOIN Appointments a1
ON p.PatientID=a1.PatientID
JOIN Appointments a2
ON a1.PatientID=a2.PatientID
WHERE DATEDIFF(a2.AppointmentDate,a1.AppointmentDate)=1;
-- 39>For each doctor, list their name and the number of unique patients they've treated.
SELECT d.Name, COUNT(DISTINCT a.PatientID) AS TotalPatients
FROM Doctors d
JOIN Appointments a
ON d.DoctorID=a.DoctorID
GROUP BY d.Name;
-- 40>Display a report of patients, their total number of appointments, total bill amount, and number of medications prescribed.
SELECT p.Name,
COUNT(DISTINCT a.AppointmentID) AS TotalAppointments,
SUM(DISTINCT b.Amount) AS TotalBill,
COUNT(DISTINCT pr.MedicationID) AS TotalMedications
FROM Patients p
LEFT JOIN Appointments a
ON p.PatientID=a.PatientID
LEFT JOIN Bills b
ON p.PatientID=b.PatientID
LEFT JOIN Prescriptions pr
ON p.PatientID=pr.PatientID
GROUP BY p.Name;