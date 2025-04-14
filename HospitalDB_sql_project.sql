CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    address TEXT
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15)
);

-- Visits table
CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    reason TEXT,
    diagnosis TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Treatments table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT,
    treatment_description TEXT,
    cost DECIMAL(10,2),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);

-- Medications table
CREATE TABLE Medications (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    med_name VARCHAR(100),
    dosage VARCHAR(50)
);

-- Prescriptions table
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT,
    med_id INT,
    quantity INT,
    instructions TEXT,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (med_id) REFERENCES Medications(med_id)
);

INSERT INTO Patients (first_name, last_name, gender, dob, phone, address)
VALUES ('Alex', 'Ayob', 'Male', '1985-05-12', '555-1234', '123 Main St');

INSERT INTO Doctors (first_name, last_name, specialization, phone)
VALUES ('Alice', 'Smith', 'Cardiology', '555-5678');

INSERT INTO Visits (patient_id, doctor_id, visit_date, reason, diagnosis)
VALUES (1, 1, '2025-04-10', 'Chest pain', 'Angina');

INSERT INTO Treatments (visit_id, treatment_description, cost)
VALUES (1, 'ECG and medication', 200.00);

INSERT INTO Medications (med_name, dosage)
VALUES ('Aspirin', '75mg daily');

INSERT INTO Prescriptions (visit_id, med_id, quantity, instructions)
VALUES (1, 1, 30, 'Take one daily with water');
