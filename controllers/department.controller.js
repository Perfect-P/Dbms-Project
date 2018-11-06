var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
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


module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
	var id = req.params.id;
	connection.query("SELECT * FROM departments where dept_id = ?",
		id, 
		function (err, result, fields) {
		if (err){
			console.log(err);
		}
		res.render('departments/edit',{depts: result});
	});
}

module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
	var lvl =req.params.id;
	connection.query('call update_dept(?,?,?,?)',
		[req.body.id,req.body.name,req.body.address,parseFloat(req.body.phone)],
		function(err,result,fields){
		if(err) console.log(err);
		res.redirect('/departments');
	});
}

module.exports.delete = function(req,res){
	var id =req.params.id;
	connection.query('call delete_dept(?)',id,function(err,result,fields){
		if(err) throw err;
		res.redirect('/departments');
	});
}