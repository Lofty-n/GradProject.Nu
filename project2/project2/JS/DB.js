import mysql from 'mysql2'

const pool = mysql.createPool({
   host: '127.0.0.1',
   user: 'root',
   password: '1234',
   database: 'Project2_DB'
}).promise()

async function InsertValue(value) {
   const [rows] = await pool.query('INSERT INTO user (Value) VALUES (? , ?, ? ,? , ?)', [value])
   return rows
}
