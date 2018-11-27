var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});

module.exports.index = function(req,res){
	var sql = "SELECT * from positions";
	connection.query(sql,function(err,result,fields){
		if(err) throw err
		res.render('positions/index', {positions: result});
	});
}