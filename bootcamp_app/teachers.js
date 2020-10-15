const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const arg = process.argv.slice(2)[0];
const queryString = `
SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assists
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id 
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teacher, cohort
ORDER BY teacher; `;
const values = [`${arg}`];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(ar => {
    console.log(`${ar.cohort}:${ar.teacher}`)
  });
})
.catch(err => console.error('query error', err.stack));