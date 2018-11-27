var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});

module.exports.index = function(req,res){
	var sql = "SELECT emp_name,pos_name,inauguration from employees join time_working on employees.emp_id=time_working.emp_id join positions on time_working.pos_id=positions.pos_id";
	connection.query(sql,function(err,result,fields){
		res.render('timeWorking/index', {tiwo: result});
	});
}