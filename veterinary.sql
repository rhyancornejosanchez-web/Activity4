CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);


CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(50),
    phone INT,
    email VARCHAR(50)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate DATE
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATE,
    doctorid INT,
    diagnosis VARCHAR(50),
    prescription VARCHAR(50),
    notes TEXT
);

INSERT INTO owners (ownerid, ofirstname, olastname, phone, email) VALUES
(1, 'John', 'Carter', '555-0101', 'john.carter@example.com'),
(2, 'Emily', 'Dawson', '555-0102', 'emily.dawson@example.com'),
(3, 'Michael', 'Reyes', '555-0103', 'michael.reyes@example.com'),
(4, 'Sarah', 'Mitchell', '555-0104', 'sarah.mitchell@example.com'),
(5, 'David', 'Gibson', '555-0105', 'david.gibson@example.com'),
(6, 'Laura', 'Santos', '555-0106', 'laura.santos@example.com'),
(7, 'Andrew', 'Wallace', '555-0107', 'andrew.wallace@example.com'),
(8, 'Hannah', 'Lopez', '555-0108', 'hannah.lopez@example.com'),
(9, 'Kevin', 'Brooks', '555-0109', 'kevin.brooks@example.com'),
(10, 'Natalie', 'Porter', '555-0110', 'natalie.porter@example.com');
