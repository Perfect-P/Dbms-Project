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
	var sql = "SELECT * from positions";
	connection.query(sql,function(err,result,fields){
		if(err) throw err
		res.render('position/index', {positions: result.splice(start,end), n: pages, current: currentPage});
	});
}