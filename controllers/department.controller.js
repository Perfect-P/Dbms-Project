var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});

module.exports.index = function(req,res){
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =4;
	var start = (page -1)*perPage;
	var end = page*perPage;
	connection.query('select * from departments', function(err,result,fields){
		if(err) console.log(err);
		res.render('departments/index',{depts:result.splice(start,end), n: pages, current: currentPage});
	});
}
module.exports.search = function(req,res){// tim kiem nhan vien
	var q =req.query.q;
	var data;
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =4;
	var start = (page -1)*perPage;
	var end = page*perPage;
	connection.query("select * from departments",
		function(err,result,next){
		if(err) throw err;
		data = result.filter(function(dept){
			return dept.dept_name.toLowerCase().indexOf(q.toLowerCase()) !== -1;
		});
		res.render('departments/index', {depts: data.splice(start,end), n: pages, current: currentPage});
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


module.exports.getID = function (req, res) { // view employee
	var id = req.params.id;
	var sql = "SELECT * FROM departments where dept_id = ?"
	connection.query(sql,
		id,
		function (err, results, fields) {
			if (err) {
				console.log(err);
			}
			res.render('departments/view', { depts: results });
		});
}