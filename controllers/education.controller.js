var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});
module.exports.index = function(req,res){
	var sql = "SELECT * from educations";
	connection.query(sql,function(err,result,fields){
		res.render('educations/index',{education: result});
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
    	res.redirect('/educations');
    });
}