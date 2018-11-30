var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password: "student",
	database:"dbms"
});

module.exports.index = function(req,res){
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =5;
	var start = (page -1)*perPage;
	var end = page*perPage;
	var sql = "SELECT * from employees join time_working on employees.emp_id=time_working.emp_id join positions on time_working.pos_id=positions.pos_id";
	connection.query(sql,function(err,result,fields){
		res.render('timeWorking/index', {tiwo: result.splice(start,end), n: pages, current: currentPage});
	});
}

module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
    var id = req.params.id.split('+');
    console.log(id);
    connection.query("SELECT * FROM time_working where emp_id = ? and pos_id=?",
        [id[0],id[1]],
        function (err, result, fields) {
        if (err){
            console.log(err);
        }
        res.render('timeWorking/edit',{tiwo: result});
    });
}
module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
    var id =req.params.id;
    connection.query('call update_pos(?,?,?,?)',
    [id,req.body.name,req.body.major,req.body.evaluation],
        function(err,result,fields){
        if(err) console.log(err)
        res.redirect('/timeWorking');
    });
}
module.exports.delete = function(req,res){
    var id =req.params.id;
    connection.query('call delete_pos(?)',id,function(err,result,fields){
        if(err) throw err;
        res.redirect('/timeWorking');
    });
}