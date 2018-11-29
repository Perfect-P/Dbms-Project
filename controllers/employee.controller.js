var date = require('date-and-time');
var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
  host: "localhost",
	user: "student",
	password:"student",
  	database:"dbms",
  	multipleStatements: true
});


module.exports.index = function(req,res, next){ // hien thi cac nhan vien co trong csdl
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =8;
	var start = (page -1)*perPage;
	var end = page*perPage;
	connection.query("SELECT emp_name, emp_address, emp_id FROM employees",
		function (err, result, fields) {
		if (err) throw err;
	    res.render('employees/index', {emps: result.splice(start,end), n: pages, current: currentPage});
	});
}


module.exports.search = function(req,res){// tim kiem nhan vien
	var q =req.query.q;
	var data;
	connection.query("select * from employees",
		function(err,result,next){
		if(err) throw err;
		data = result.filter(function(emp){
			return emp.emp_name.toLowerCase().indexOf(q.toLowerCase()) !== -1;
		});
		res.render('employees/index', {emps: data});
	});
}
module.exports.create = function(req,res){  // render trang create
	connection.query('select * from salary', function(err,result,fileds){
		if (err) throw err;
		res.render('employees/create',{salary: result});
	})  
}


module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('call add_emp(?,?,?,?,?,?,?,?)',
    [req.body.id,req.body.name,req.body.address,req.body.gender,
    req.body.birthday,parseFloat(req.body.phone),req.body.salary,
    req.body.education,req.body.position],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/employees');
    });
    
}
 
module.exports.getID =function(req,res){ // view employee
	var id = req.params.id;
	var sql="SELECT * FROM employees where emp_id = ?; select show_sal(?) as sum_salary; call show_edu(?); call show_pos(?)"
	connection.query(sql,
		[id,id,id,id],
		function (err, results, fields) {
		if (err){
			console.log(err);
		}
	    res.render('employees/view', {emps: results[0], salary: results[1], education: results[2], position: results[4]});
	});
}

module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
	var id = req.params.id;
	connection.query("SELECT * FROM employees where emp_id = ?; select * from salary",
		id, 
		function (err, results, fields) {
		if (err){
			console.log(err);
		}
		res.render('employees/edit',{emps: results[0], salary: results[1]});
	});
}

module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
	var id =req.params.id;
	connection.query('call update_emp(?,?,?,?,?,?,?)',
	[id,req.body.name,req.body.address,req.body.gender,req.body.birthday,parseFloat(req.body.phone),req.body.username],
		function(err,result,fields){
		if(err) console.log(err)
		res.redirect('/employees')
	});
}

module.exports.delete = function(req,res){
	var id =req.params.id;
	connection.query('call delete_emp(?)',id,function(err,result,fields){
		if(err) throw err;
		res.redirect('/employees');
	});
}

