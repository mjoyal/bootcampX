const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const args = process.argv.slice(2);

pool.query(`SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assists
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id 
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${args[0]}'
GROUP BY teacher, cohort
ORDER BY teacher; `)
.then(res => {
  res.rows.forEach(ar => {
    console.log(`${ar.cohort}:${ar.teacher}`)
  });
})
.catch(err => console.error('query error', err.stack));