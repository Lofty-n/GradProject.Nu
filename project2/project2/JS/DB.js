import mysql from 'mysql2'

const pool = mysql.createPool({
   host: '127.0.0.1',
   user: 'root',
   password: '1234',
   database: 'Project2_DB'
}).promise()

async function GetTable() {
   const [rows] = await pool.query('SELECT * FROM User')
   return rows
}
const Notes = await GetTable()
console.log(Notes)
