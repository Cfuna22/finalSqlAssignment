-- Create Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctor Table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Patient Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

-- Create Appointment Table (Many-to-One: Many appointments to one patient/doctor)
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Treatment Table
CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    description TEXT NOT NULL,
    treatment_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- Create Prescription Table (1-to-1 with Treatment)
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    treatment_id INT UNIQUE NOT NULL,
    medicine TEXT NOT NULL,
    dosage VARCHAR(100),
    FOREIGN KEY (treatment_id) REFERENCES Treatment(treatment_id)
);
