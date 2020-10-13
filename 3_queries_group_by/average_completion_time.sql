SELECT students.name as student, avg(assignment_submissions.duration) as avg_assignment_duration
FROM assignment_submissions 
JOIN students ON assignment_submissions.student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY avg_assignment_duration DESC; 

