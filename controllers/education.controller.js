var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});
module.exports.index = function(req,res){
	var sql = "SELECT * from educations";
	connection.query(sql,function(err,result,fields){
		res.render('educations/index',{education: result});
	});
}

module.exports.create = function(req,res){  // render trang create
    res.render('educations/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into educations values(?,?,?)',
    [req.body.id,req.body.name,req.body.major],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/educations');
    });
}

module.exports.edit = function (req, res) { // goi procedure trong mysql va chinh sua database
	var id = req.params.id;
	connection.query("SELECT * FROM educations where edu_id = ?",
		id,
		function (err, result, fields) {
			if (err) {
				console.log(err);
			}
			res.render('educations/edit', { education: result });
		});
}

module.exports.postEdit = function (req, res) {// submit thong tin da chinh sua
	var lvl = req.params.id;
	connection.query('call update_edu(?,?,?)',
		[req.body.id, req.body.name, req.body.major],
		function (err, result, fields) {
			if (err) console.log(err);
			res.redirect('/educations');
		});
}

module.exports.delete = function (req, res) {
	var id = req.params.id;
	connection.query('call delete_edu(?)', id, function (err, result, fields) {
		if (err) throw err;
		res.redirect('/educations');
	});
}