CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;
-- Patients Table
CREATE TABLE Patients(
    PatientId INT PRIMARY KEY,
    Name VARCHAR(25),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    City VARCHAR(25)
);
-- Doctors Table
CREATE TABLE Doctors(
    DoctorId INT PRIMARY KEY,
    Name  VARCHAR(25),
    Specialization VARCHAR(25),
    PhoneNumber VARCHAR(15)
);
-- Appointments Table
CREATE TABLE Appointments(
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
-- Bills Table
CREATE TABLE Bills(
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
-- Medications Table
CREATE TABLE Medications(
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(50)
);
-- Prescriptions Table
CREATE TABLE Prescriptions(
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    PrescriptionDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

