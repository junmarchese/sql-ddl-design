INSERT INTO Doctors
  (name, specialty)
VALUES
  ('John Doe','Nephrologist'),
  ('Mary Jane','Ear, Nose, Throat');

INSERT INTO Patients
  (name, insurance, date_of_birth)
VALUES
  ('Jane Lewis', 'Blue Cross Blue Shield TX', '1981-01-11'),
  ('Mike Smith', 'Cigna', '1975-05-07');

INSERT INTO Diseases
  (name, description)
VALUES
  ('Asthma', 'Moderate-Severe Bronchospasm'),
  ('Acute renal failure', 'GFR < 40');

INSERT INTO Visits
  (doctor_id, patient_id, visit_date)
VALUES
  (2, 1, '2024-07-10'),
  (1, 2, '2024-07-11');

INSERT INTO Diagnoses
  (disease_id, visit_id, notes)
VALUES
  (1, 1, 'Continous coughing, wheezing, acute re-exacerbation of chronic asthma'),
  (2, 2, 'chronic renal failure requiring dialysis');





