var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});

module.exports.index = function(req,res){
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =5;
	var start = (page -1)*perPage;
	var end = page*perPage;
	var sql = "SELECT emp_name,pos_name,inauguration from employees join time_working on employees.emp_id=time_working.emp_id join positions on time_working.pos_id=positions.pos_id";
	connection.query(sql,function(err,result,fields){
		res.render('timeWorking/index', {tiwo: result.splice(start,end), n: pages, current: currentPage});
	});
}