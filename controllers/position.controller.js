var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});

module.exports.index = function(req,res){
	var sql = "SELECT * from positions";
	connection.query(sql,function(err,result,fields){
		if(err) throw err
		res.render('positions/index', {position: result});
	});
}

module.exports.create = function (req, res) {  // render trang create
	res.render('positions/create');
}

module.exports.postCreate = function (req, res) {// them nhan vien vao
	connection.query('insert into positions values(?,?,?)',
		[req.body.id, req.body.name],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.redirect('/positions');
		});
}

module.exports.edit = function (req, res) { // goi procedure trong mysql va chinh sua database
	var id = req.params.id;
	connection.query("SELECT * FROM positions where pos_id = ?",
		id,
		function (err, result, fields) {
			if (err) {
				console.log(err);
			}
			res.render('positions/edit', { position: result });
		});
}

module.exports.postEdit = function (req, res) {// submit thong tin da chinh sua
	var lvl = req.params.id;
	connection.query('call update_pos(?,?,?)',
		[req.body.id, req.body.name],
		function (err, result, fields) {
			if (err) console.log(err);
			res.redirect('/positions');
		});
}

module.exports.delete = function (req, res) {
	var id = req.params.id;
	connection.query('call delete_pos(?)', id, function (err, result, fields) {
		if (err) throw err;
		res.redirect('/positions');
	});
}