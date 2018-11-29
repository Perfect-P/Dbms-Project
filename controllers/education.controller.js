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
	var sql = "SELECT * from educations";
	connection.query(sql,function(err,result,fields){
		res.render('education/index',{education: result.splice(start,end), n: pages, current: currentPage});
	});
}

module.exports.create = function(req,res){  // render trang create
    res.render('education/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into educations values(?,?,?,?)',
    [req.body.id,req.body.name,req.body.major,req.body.evaluation],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/education');
    });
}