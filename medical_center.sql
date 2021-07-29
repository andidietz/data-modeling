DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

/c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  doctor TEXT NOT NULL
);

CREATE TABLE patients
(
  -- is it standard to add the Primary Key constrait to the id,
  -- or leave it off since it is a default trait of ids?
  id SERIAL PRIMARY KEY,
  patient TEXT NOT NULL
);

CREATE TABLE illnesses
(
  id SERIAL PRIMARY KEY,
  illness TEXT NOT NULL
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  appt_time TIMESTAMP NOT NULL,
  patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
  doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
  illness_id INTEGER REFERENCES illnesses ON DELETE SET NULL
);

INSERT INTO doctors 
  (doctor)
VALUES
  ('Max Book'),
  ('Karen Page');

INSERT INTO patients
  (patient)
VALUES
  ('Lilly Green'),
  ('Sammy Bluewall');

INSERT INTO illnesses
  (illness)
VALUES
  ('Cold'),
  ('Flu'),
  ('Sinus Infection');

INSERT INTO visits
  (appt_time, patient_id, doctor_id, illness_id) 
VALUES
  ('2018-12-19 12:45:00', 1, 2, 2),
  ('2018-12-19 7:45:00', 2, 2, 3);