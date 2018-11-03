var express= require('express');
var app = express();
var mysql =require('mysql');
var pug = require('pug'); 
app.set('view engine', 'pug');
app.set('views', './views');

var con = mysql.createConnection({
  host: "localhost",
  user: "student",
  password:"student",
  database:"dbms"
});


var empRoute = require('./routes/employee.route');


app.use('/employees', empRoute);
app.get('/',function(req,res){
  res.render('index');
});
// app.get('/employees',function(req,res){
//   con.connect(function(err) {
//     if (err) throw err;
//     con.query("SELECT name, address FROM customers", function (err, result, fields) {
//       if (err) throw err;
//       res.render('employees/index', {emps: result});
//     });
//   });
// });


var port =3000;

app.listen(port,function(){
    console.log('Server listening at port: '+ port);
});