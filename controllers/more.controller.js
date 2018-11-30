var date = require('date-and-time');
var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
  	host: "localhost",
		user: "root",
  	database:"dbms",
  	multipleStatements: true
});

module.exports.index =function(req,res){
	res.render('more/index');
}

module.exports.test = function (req, res) {
	res.render('more/test');
}


module.exports.postIndex = function (req, res) {// them nhan vien vao
	connection.query('select days_worked(?) as days_sum',
		[req.body.id],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.render('more/result', {dws: result});
		});
}