CREATE TABLE cohorts (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL, 
start_date DATE, 
end_date DATE
); 

CREATE TABLE students (
id SERIAL PRIMARY KEY, 
name VARCHAR(255) NOT NULL,
email VARCHAR(50), 
phone VARCHAR(50), 
github VARCHAR(50),
start_date DATE, 
end_date DATE, 
cohort_id INT REFERENCES cohorts(id) ON DELETE CASCADE
); 

