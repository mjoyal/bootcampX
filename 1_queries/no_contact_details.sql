SELECT name, id, cohort_id
FROM students
WHERE name IS null OR phone IS null; 
