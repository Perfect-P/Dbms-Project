var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});
module.exports = createDbConnection;