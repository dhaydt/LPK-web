
const mysql = require('mysql2');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'lpk',
  password: ''
});
connection.connect();
module.exports = connection;
