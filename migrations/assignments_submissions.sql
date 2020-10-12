CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL, 
  content TEXT, 
  day INT,
  chapter INT, 
  duration INT
); 

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY,
  assignment_id INT REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  duration INT, 
  submission_date DATE
); 
