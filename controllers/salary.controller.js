var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});

module.exports.index = function(req,res){
	connection.query('select * from salary', function(err,result,fields){
		if(err) console.log(err);
		res.render('salary/index',{salary: result});
	});
}