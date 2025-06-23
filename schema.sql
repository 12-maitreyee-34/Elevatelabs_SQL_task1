CREATE DATABASE HospitalDB;



CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);


CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(15),
    address TEXT
);


CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date DATE,
    time TIME,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    date DATE,
    notes TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);


CREATE TABLE Prescription_Medicine (
    prescription_id INT,
    medicine_id INT,
    quantity INT,
    instructions TEXT,
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);


CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis TEXT,
    treatment TEXT,
    notes TEXT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


CREATE TABLE Room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE,
    type VARCHAR(50),
    status VARCHAR(50)
);


CREATE TABLE Patient_Room (
    patient_id INT,
    room_id INT,
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (patient_id, room_id, from_date),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10,2),
    date DATE,
    method VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

ALTER TABLE Patient
ADD blood_group VARCHAR(5);


ALTER TABLE Doctor
MODIFY phone VARCHAR(20);
select * from Patient;