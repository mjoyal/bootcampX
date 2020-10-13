CREATE TABLE teachers (
id SERIAL PRIMARY KEY, 
name VARCHAR(255) NOT NULL,
start_date DATE, 
end_date DATE, 
is_active BOOLEAN DEFAULT TRUE
); 

CREATE TABLE assistance_requests (
id SERIAL PRIMARY KEY, 
teacher_id INT REFERENCES teachers(id) ON DELETE CASCADE,
student_id INT REFERENCES students(id) ON DELETE CASCADE,
assignment_id INT REFERENCES assignments(id) ON DELETE CASCADE,
created_at TIMESTAMP,
started_at TIMESTAMP,
completed_at TIMESTAMP,
student_feedback TEXT, 
teacher_feedback TEXT
); 

