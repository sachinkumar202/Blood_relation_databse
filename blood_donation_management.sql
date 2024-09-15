-- 1. Create the blood donation database
CREATE DATABASE blood_donation_db;
USE blood_donation_db;

-- 2. Create a table for blood donors
CREATE TABLE donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    birth_date DATE,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    donation_frequency ENUM('Once', 'Regular', 'Occasional')
);

-- 3. Create a table for blood banks
CREATE TABLE blood_bank (
    blood_bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(100),
    address TEXT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    capacity INT, -- Capacity for blood storage in liters
    available_blood INT -- Current available blood in liters
);

-- 4. Create a table for donations
CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT,
    blood_bank_id INT,
    donation_date DATE,
    quantity DECIMAL(5, 2), -- Quantity of blood donated in liters
    FOREIGN KEY (donor_id) REFERENCES donors(donor_id),
    FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id)
);

-- 5. Create a table for blood recipients
CREATE TABLE recipients (
    recipient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

-- 6. Create a table for blood transfusions (blood provided to recipients)
CREATE TABLE transfusions (
    transfusion_id INT AUTO_INCREMENT PRIMARY KEY,
    recipient_id INT,
    blood_bank_id INT,
    transfusion_date DATE,
    quantity DECIMAL(5, 2), -- Quantity of blood used in liters
    FOREIGN KEY (recipient_id) REFERENCES recipients(recipient_id),
    FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id)
);
