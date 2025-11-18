CREATE DATABASE veterinary;
USE veterinary;


CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    registereddate DATE
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
    phone VARCHAR(20),
    email VARCHAR(50)
);


CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymenttime TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);


CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    diagnosis VARCHAR(100),
    prescription VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);


INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email, registereddate) 
VALUES
    (1, 'John', 'Carter', 'City 1', '09023426016', 'john.carter@example.com', NULL),
    (2, 'Emily', 'Dawson', 'City 2', '09320848135', 'emily.dawson@example.com', NULL),
    (3, 'Michael', 'Reyes', 'City 3', '09234574284', 'michael.reyes@example.com', NULL),
    (4, 'Sarah', 'Mitchell', 'City 4', '09983154152', 'sarah.mitchell@example.com', NULL),
    (5, 'David', 'Gibson', 'City 5', '09487284187', 'david.gibson@example.com', NULL),
    (6, 'Laura', 'Santos', 'City 6', '09092342601', 'laura.santos@example.com', NULL),
    (7, 'Andrew', 'Wallace', 'City 7', '09082342661', 'andrew.wallace@example.com', NULL),
    (8, 'Hannah', 'Lopez', 'City 8', '09101445386', 'hannah.lopez@example.com', NULL),
    (9, 'Kevin', 'Brooks', 'City 9', '09712309846', 'kevin.brooks@example.com', NULL),
    (10, 'Natalie', 'Porter', 'City 10', '09231236757', 'natalie.porter@example.com', NULL);


INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
    (1, 'Buddy', 'Dog', 'Labrador', '2019-03-15', 'Male', 'Crimson-Red', 1),
    (2, 'Mittens', 'Cat', 'Siamese', '2020-07-10', 'Female', 'Cream', 2),
    (3, 'Rocky', 'Dog', 'Bulldog', '2018-11-05', 'Male', 'Brown', 3),
    (4, 'Luna', 'Cat', 'Persian', '2021-02-21', 'Female', 'White', 4),
    (5, 'Charlie', 'Dog', 'Beagle', '2017-09-12', 'Male', 'Tri-color', 5),
    (6, 'Bella', 'Rabbit', 'Mini Rex', '2022-01-02', 'Female', 'Gray', 6),
    (7, 'Max', 'Dog', 'German Shepherd', '2016-06-30', 'Male', 'Black/Tan', 7),
    (8, 'Coco', 'Bird', 'Parrot', '2015-12-19', 'Female', 'Green', 😎,
    (9, 'Shadow', 'Cat', 'Maine Coon', '2019-04-25', 'Male', 'Black', 9),
    (10, 'Daisy', 'Dog', 'Poodle', '2020-10-14', 'Female', 'White', 10);


INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
    (11, 1, '2025-02-01', 'Allergy'),
    (12, 2, '2025-05-27', 'Vaccination'),
    (13, 3, '2025-05-10', 'Allergy'),
    (14, 4, '2025-07-23', 'Vaccination'),
    (15, 5, '2025-07-24', 'Physical Examination'),
    (16, 6, '2025-09-03', 'Urinary Tract Infections'),
    (17, 5, '2025-09-29', 'Allergy'),
    (18, 8, '2025-11-17', 'Vaccination'),
    (19, 9, '2025-12-01', 'Vaccination'),
    (20, 5, '2025-12-18', 'Allergy');


INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
    (1, 'Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
    (2, 'Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
    (3, 'Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
    (4, 'Sofia', 'Reyes-Gonzales', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
    (5, 'Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
    (6, 'Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');


INSERT INTO invoices(invoiceid, appointid, totalamount, paymenttime)
VALUES
    (1, 11, 50.00, '09:30:00'),
    (2, 12, 75.00, '14:15:00'),
    (3, 13, 100.00, '11:00:00'),
    (4, 14, 200.00, '13:45:00'),
    (5, 15, 80.00, '10:30:00'),
    (6, 16, 30.00, '15:00:00'),
    (7, 17, 75.00, '09:15:00'),
    (8, 18, 150.00, '16:30:00'),
    (9, 19, 60.00, '14:45:00'),
    (10, 20, 40.00, '11:30:00');


INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Prescribed antihistamines'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops');


SELECT DISTINCT species FROM animals;

SELECT SUM(totalamount) AS total_income FROM invoices;


SELECT COUNT(*) AS appointment_count 
FROM appointments ap
JOIN animals an ON ap.animalid = an.animalid
WHERE an.ownerid = 8;


SELECT a.name, COUNT(ap.appointid) AS total_appointments 
FROM animals a 
JOIN appointments ap 
ON a.animalid = ap.animalid 
GROUP BY a.animalid, a.name 
ORDER BY total_appointments DESC
LIMIT 1;