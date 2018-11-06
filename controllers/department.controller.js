var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password:"student",
	database:"dbms"
});

module.exports.index = function(req,res){
	connection.query('select * from departments', function(err,result,fields){
		if(err) console.log(err);
		res.render('departments/index',{depts: result});
	});
}

module.exports.create = function(req,res){  // render trang create
    res.render('departments/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into departments values(?,?,?,?)',
    [req.body.id,req.body.name,req.body.address,parseFloat(req.body.phone)],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/departments');
    });
}