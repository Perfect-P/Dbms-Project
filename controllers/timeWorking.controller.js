var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});

module.exports.index = function (req, res) {
	var page = parseInt(req.query.page) || 1;
	var currentPage = [page];
	var pages = [page, page + 1, page + 2];
	var perPage = 5;
	var start = (page - 1) * perPage;
	var end = page * perPage;
	var sql = "SELECT emp_name,pos_name,inauguration from employees join time_working on employees.emp_id=time_working.emp_id join positions on time_working.pos_id=positions.pos_id";
	connection.query(sql, function (err, result, fields) {
		res.render('timeWorking/index', { tiwo: result.splice(start, end), n: pages, current: currentPage });
	});
}

module.exports.create = function (req, res) {  // render trang create
	res.render('timeWorking/create');
}

module.exports.postCreate = function (req, res) {// them nhan vien vao
	connection.query('insert into time_working values(?,?,?)',
		[req.body.emp_id, req.body.pos_id, req.body.inauguration],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.redirect('/timeWorking');
		});
}

module.exports.edit = function (req, res) { // goi procedure trong mysql va chinh sua database
	var emp_id = req.params.emp_id;
	var pos_id = req.params.pos_id;
	connection.query("SELECT * FROM time_working where emp_id = ? and pos_id = ?",
		emp_id, pos_id,
		function (err, result, fields) {
			if (err) {
				console.log(err);
			}
			res.render('timeWorking/edit', { tiwo: result });
		});
}

module.exports.postEdit = function (req, res) {// submit thong tin da chinh sua
	connection.query('call update_tw(?,?,?)',
		[req.body.emp_id, req.body.pos_id, req.body.inauguration],
		function (err, result, fields) {
			if (err) console.log(err);
			res.redirect('/timeWorking');
		});
}

module.exports.delete = function (req, res) {
	var emp_id = req.params.emp_id;
	var pos_id = req.params.pos_id;
	connection.query('call delete_tw(?, ?)', emp_id, pos_id, function (err, result, fields) {
		if (err) throw err;
		res.redirect('/timeWorking');
	});
}
