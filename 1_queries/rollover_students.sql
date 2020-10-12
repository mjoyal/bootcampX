SELECT student.name as student_name, student.start_date as student_start_date, cohort.name as cohort_name, cohort.start_date as cohort_start_date
FROM students JOIN cohorts ON cohort.id
WHERE cohort_start_date != student_start_date
ORDER BY cohort_start_date; 