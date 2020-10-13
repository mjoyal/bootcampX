SELECT cohorts.name as cohort, count(assignment_submissions.*)
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id 
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.*) DESC;









-- count each cohorts total submissions 

-- SELECT column-names
--   FROM table-name1 JOIN table-name2 
--     ON column-name1 = column-name2
--  WHERE condition