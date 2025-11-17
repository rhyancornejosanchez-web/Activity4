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
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATE,
    doctorid INT,
    diagnosis VARCHAR(50),
    prescription VARCHAR(50),
    notes TEXT
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, phone, email) 
VALUES
    (1, 'John', 'Carter', '09023426016', 'john.carter@example.com'),
    (2, 'Emily', 'Dawson', '09320848135', 'emily.dawson@example.com'),
    (3, 'Michael', 'Reyes', '09234574284', 'michael.reyes@example.com'),
    (4, 'Sarah', 'Mitchell', '09983154152', 'sarah.mitchell@example.com'),
    (5, 'David', 'Gibson', '09487284187', 'david.gibson@example.com'),
    (6, 'Laura', 'Santos', '09092342601', 'laura.santos@example.com'),
    (7, 'Andrew', 'Wallace', '09082342661', 'andrew.wallace@example.com'),
    (8, 'Hannah', 'Lopez', '09101445386', 'hannah.lopez@example.com'),
    (9, 'Kevin', 'Brooks', '09712309846', 'kevin.brooks@example.com'),
    (10, 'Natalie', 'Porter', '09231236757', 'natalie.porter@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
    (1, 'Buddy', 'Dog', 'Labrador', '2019-03-15', 'Male', 'Crimson-Red', 1),
    (2, 'Mittens', 'Cat', 'Siamese', '2020-07-10', 'Female', 'Cream', 2),
    (3, 'Rocky', 'Dog', 'Bulldog', '2018-11-05', 'Male', 'Brown', 3),
    (4, 'Luna', 'Cat', 'Persian', '2021-02-21', 'Female', 'White', 4),
    (5, 'Charlie', 'Dog', 'Beagle', '2017-09-12', 'Male', 'Tri-color', 5),
    (6, 'Bella', 'Rabbit', 'Mini Rex', '2022-01-02', 'Female', 'Gray', 6),
    (7, 'Max', 'Dog', 'German Shepherd', '2016-06-30', 'Male', 'Black/Tan', 7),
    (8, 'Coco', 'Bird', 'Parrot', '2015-12-19', 'Female', 'Green', 8),
    (9, 'Shadow', 'Cat', 'Maine Coon', '2019-04-25', 'Male', 'Black', 9),
    (10, 'Daisy', 'Dog', 'Poodle', '2020-10-14', 'Female', 'White', 10);

INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
    (1.1, 1, 2025-02-01, 'Allergy'),
    (1.2, 2, 2025-05-27, 'Vaccination'),
    (1.3, 3, 2025-05-10, 'Allergy'),
    (1.4, 4, 2025-07-23, 'Vaccination'),
    (1.5, 5, 2025-07-24, 'Physical Examination'),
    (1.6, 6, 2025-09-03, 'Urinary Tract Infections'),
    (1.7, 5, 2025-09-29, 'Allergy'),
    (1.8, 8, 2025-11-17, 'Vaccination'),
    (1.9, 9, 2025-12-01, 'Vaccination'),
    (1.10, 5, 2025-12-18, 'Allergy');


INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
    (1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
    (2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
    (3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
    (4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
    (5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
    (6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
    (1, 1.1, 50.00, '09:30:00'),
    (2, 1.2, 75.00, '14:15:00'),
    (3, 1.3, 100.00, '11:00:00'),
    (4, 1.4, 200.00, '13:45:00'),
    (5, 1.5, 80.00, '10:30:00'),
    (6, 1.6, 30.00, '15:00:00'),
    (7, 1.7, 75.00, '09:15:00'),
    (8, 1.8, 150.00, '16:30:00'),
    (9, 1.9, 60.00, '14:45:00'),
    (10, 1.10, 40.00, '11:30:00');

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
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');
