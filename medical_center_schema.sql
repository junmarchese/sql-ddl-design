-- COMMENT OUT these lines if tables already exist
DROP DATABASE IF EXISTS medical_center_schema;

CREATE DATABASE medical_center_schema;

\c medical_center_schema

CREATE TABLE Doctors (
  doctor_id SERIAL PRIMARY KEY,
  full_name VARCHAR(200) NOT NULL,
  specialty VARCHAR(200)
);
  
-- COMMENT ON COLUMN Doctors.doctor_id IS 'Unique identifier for each doctor';
-- COMMENT ON COLUMN Doctors.name IS 'Doctor full name';
-- COMMENT ON COLUMN Doctors.specialty IS 'Doctor area of specialization';

CREATE TABLE Patients (
  patient_id    SERIAL PRIMARY KEY,
  full_name     VARCHAR(200) NOT NULL,
  date_of_birth DATE         NOT NULL,
  insurance     VARCHAR(255)
);

-- COMMENT ON COLUMN Patients.patient_id IS 'Unique identifier for each patient';
-- COMMENT ON COLUMN Patients.name IS 'Patient full name';
-- COMMENT ON COLUMN Patients.date_of_birth IS 'Patient date of birth';
-- COMMENT ON COLUMN Patients.insurance IS 'Basic insurance information';


CREATE TABLE Visits (
  visit_id   SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES Patients(patient_id),
  doctor_id  INTEGER REFERENCES Doctors(doctor_id),
  visit_date DATE NOT NULL
);

-- COMMENT ON COLUMN Visits.visit_id IS 'Unique identifier for each visit';
-- COMMENT ON COLUMN Visits.patient_id IS 'Patient being seen';
-- COMMENT ON COLUMN Visits.doctor_id IS 'Doctor performing visit';
-- COMMENT ON COLUMN Visits.visit_date IS 'Date of visit';

CREATE TABLE Diseases (
  disease_id    SERIAL PRIMARY KEY,
  disease_name  VARCHAR(255) NOT NULL,
  description   TEXT
);

-- COMMENT ON COLUMN Diseases.disease_id IS 'Unique identifier for each disease';
-- COMMENT ON COLUMN Diseases.name IS 'Name of disease';
-- COMMENT ON COLUMN Diseases.description IS 'Detailed description of disease';


-- -- END comments


CREATE TABLE Diagnoses (
  diagnosis_id SERIAL PRIMARY KEY,
  visit_id     INTEGER REFERENCES Visits(visit_id),
  disease_id   INTEGER REFERENCES Diseases(disease_id)
  notes        TEXT
);

-- COMMENT ON COLUMN Diagnoses.diagnosis_id IS 'Unique identifier for each diagnosis';
-- COMMENT ON COLUMN Diagnoses.visit_id IS 'Visit during which diagnosis was made';
-- COMMENT ON COLUMN Diagnoses.disease_id IS 'Disease diagnosis made of patient';
-- COMMENT ON COLUMN Diagnoses.notes IS 'Doctor notes about specific diagnosis';





