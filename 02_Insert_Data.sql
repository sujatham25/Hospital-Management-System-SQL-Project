-- Insert patients values
INSERT INTO Patients (PatientId, Name, Age, Gender, Phone, City) VALUES
(1,'Amit',25,'Male','9876543210','Mumbai'),
(2,'Priya',30,'Female','9876543211','Delhi'),
(3,'Rahul',45,'Male','9876543212','Chennai'),
(4,'Sneha',65,'Female','9876543213','Mumbai'),
(5,'Arjun',55,'Male','9876543214','Hyderabad'),
(6,'Kiran',70,'Male','9876543215','Bangalore');
-- Insert Doctors vales
INSERT INTO Doctors (DoctorId, Name, Specialization, PhoneNumber) VALUES
(101,'Dr. Sharma','Orthopedics','9991111111'),
(102,'Dr. Mehta','Cardiology','9992222222'),
(103,'Dr. Reddy','Dermatology','9993333333'),
(104,'Dr. Khan','Neurology','9994444444');
-- Insert Appointments values
INSERT INTO Appointments (AppointmentId, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1,1,101,'2026-07-20','Completed'),
(2,2,102,'2026-07-21','Completed'),
(3,3,103,'2026-07-22','Scheduled'),
(4,4,101,'2026-07-23','Cancelled'),
(5,5,104,'2026-07-24','Completed'),
(6,6,102,'2026-07-25','Scheduled');
-- Insert Bills Values
INSERT INTO Bills (BillId, PatientId, Amount, BillDate, Status) VALUES
(1,1,5000,'2026-07-20','Paid'),
(2,2,8000,'2026-07-21','Paid'),
(3,3,12000,'2026-07-22','Unpaid'),
(4,4,15000,'2026-07-23','Unpaid'),
(5,5,7000,'2026-07-24','Paid'),
(6,6,20000,'2026-07-25','Unpaid');
-- Insert Medications values
INSERT INTO Medications (MedicationId, MedicationName) VALUES
(401,'Paracetamol'),
(402,'Amoxicillin'),
(403,'Ibuprofen'),
(404,'Vitamin D');
-- Insert Prescription Values
INSERT INTO Prescriptions (PrescriptionId, PatientId, DoctorID, MedicationId, PrescriptionDate) VALUES
(501,1,101,401,'2026-07-20'),
(502,1,101,403,'2026-07-20'),
(503,2,102,402,'2026-07-21'),
(504,3,103,404,'2026-07-22'),
(505,4,101,401,'2026-07-23'),
(506,5,104,403,'2026-07-24'),
(507,6,102,404,'2026-07-25');