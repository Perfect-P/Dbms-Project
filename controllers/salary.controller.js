var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
<<<<<<< HEAD
	user: "student",
	password:"student",
	database:"dbms"
=======
	user: "root",
	database: "dbms",
	multipleStatements: true
>>>>>>> e47892a9b7b0dbee3ce21262d3e2a01c5fee3529
});

module.exports.index = function(req,res){
	connection.query('select * from salary', function(err,result,fields){
		if(err) console.log(err);
		res.render('salary/index',{salary: result});
	});
}

module.exports.create = function(req,res){  // render trang create
    res.render('salary/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into salary values(?,?,?,?)',
    	[parseInt(req.body.level),parseFloat(req.body.basic),parseFloat(req.body.factor),parseFloat(req.body.exfac)],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/salary');
    });
}

module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
	var lvl = req.params.id;
	connection.query("SELECT * FROM salary where sal_lvl = ?",
		parseInt(lvl), 
		function (err, result, fields) {
		if (err){
			console.log(err);
		}
		res.render('salary/edit',{salary: result});
	});
}

module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
	var lvl =req.params.id;
	connection.query('call update_sal(?,?,?,?)',
		[parseInt(req.body.level),parseFloat(req.body.basic),parseFloat(req.body.factor),parseFloat(req.body.exfac)],
		function(err,result,fields){
		if(err) console.log(err);
		res.redirect('/salary');
	});
}

module.exports.delete = function(req,res){
	var id =req.params.id;
	connection.query('call delete_sal(?)',id,function(err,result,fields){
		if(err) throw err;
		res.redirect('/salary');
	});
}