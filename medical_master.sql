INSERT INTO Doctors
  (full_name, specialty)
VALUES
  ('John Doe','Nephrologist'),
  ('Mary Jane','Ear, Nose, Throat');

INSERT INTO Patients
  (full_name, date_of_birth, insurance)
VALUES
  ('Jane Lewis', '1981-01-11', 'Blue Cross Blue Shield TX'),
  ('Mike Smith', '1975-05-07', 'Cigna');

INSERT INTO Visits
  (patient_id, doctor_id, visit_date)
VALUES
  (1, 2, '2024-07-10'),
  (2, 1, '2024-07-11');

INSERT INTO Diseases
  (disease_name, description)
VALUES
  ('Asthma', 'shortness of breath and wheezing'),
  ('Acute renal failure', 'less urine output and swelling in legs');

INSERT INTO Diagnoses
  (visit_id, disease_id, notes)
VALUES
  (5, 1, 'Continous coughing, wheezing, acute re-exacerbation of chronic asthma'),
  (6, 2, 'chronic renal failure requiring dialysis');


