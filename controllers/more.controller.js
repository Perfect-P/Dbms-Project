var date = require('date-and-time');
var mysql =require('mysql');

var rs = null;
var connection = mysql.createConnection({ // ket noi mysql
  	host: "localhost",
		user: "root",
  	database:"dbms",
  	multipleStatements: true
});

module.exports.index =function(req,res){
	connection.query('select days_worked(?) as days_sum',
		[req.body.id],
		function (err, result, next) {
			if (err) {
				console.log(err);
			}
			res.render('more/index', { dws: result});
		});
}
