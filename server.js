var express = require('express')
var cors = require('cors')
var mysql  = require('mysql');
var app = express()
 
app.use(cors())
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'nodetest'
});
 
connection.connect(); 
app.get('/users', function (req, res, next) {
    connection.query('SELECT * FROM users', function (error, results, fields) {
        res.json(results);
        console.log(error);
        console.log(fields);
      });
})
 
app.listen(5000, function () {
  console.log('CORS-enabled web server listening on port 5000')
})