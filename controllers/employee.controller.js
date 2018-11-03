var mysql =require('mysql');
var connection = mysql.createConnection({
  host: "localhost",
  user: "student",
  password:"student",
  database:"dbms"
});


module.exports.index = function(req,res, next){
	//connection.connect();
	connection.query("SELECT name, address FROM customers", function (err, result, fields) {
		if (err) throw err;
	    res.render('employees/index', {emps: result});
	});
	//connection.end();
}