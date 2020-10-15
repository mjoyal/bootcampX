const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);

pool.query(`
SELECT students.id as id, students.name as student, cohorts.name as cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '${args[0]}%'
LIMIT ${args[1] || 5};
`)
.then(res => {
  const results = res.rows; 
  for(const result of results) {
    console.log(`${result.student} has an id of ${result.id} and was in the ${result.cohort} cohort`);
  }
})
.catch(err => console.error('query error', err.stack));