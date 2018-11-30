var date = require('date-and-time');
var mysql =require('mysql');

var rs = null;
var connection = mysql.createConnection({ // ket noi mysql
  	host: "localhost",
		user: "root",
  	database:"dbms",
  	multipleStatements: true
});

module.exports.index = function (req, res) {
	res.render('more/index');
}

module.exports.day_worked = function(req,res){
	connection.query('select days_worked(?) as days_sum',
		[req.query.id],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.render('more/day_worked', { dws: result });
		});
}

module.exports.sum_emp_in_dept = function (req, res) {
	connection.query('select sum_emp_in_dept(?) as emp_sum',
		[req.query.dept_id],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.render('more/seid', { seids: result });
		});
}

module.exports.sum_emp = function (req, res) {
	connection.query('select sum_emp() as sum_emp',
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.render('more/sum_emp', { ses: result });
		});
}

module.exports.test = function(req,res){
	res.render('more/test');
}