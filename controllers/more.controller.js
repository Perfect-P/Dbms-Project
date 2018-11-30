var date = require('date-and-time');
var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
  host: "localhost",
	user: "student",
	password:"student",
  	database:"dbms",
  	multipleStatements: true
});

module.exports.index =function(req,res){
	res.render('more/index');
}