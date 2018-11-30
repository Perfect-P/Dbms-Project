var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "student",
	password:"student",
	database:"dbms"
});

module.exports.index = function(req,res){
	var page = parseInt(req.query.page) || 1;
	var currentPage =[page];
	var pages =[page,page+1,page+2];
	var perPage =5;
	var start = (page -1)*perPage;
	var end = page*perPage;
	connection.query('select * from salary', function(err,result,fields){
		if(err) console.log(err);
		res.render('salary/index',{salary: result.splice(start,end), n: pages, current: currentPage});
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
    connection.query("select * from salary",
        function(err,result,next){
        if(err) throw err;
        data = result.filter(function(sal){
            return sal.sal_lvl.toString().toLowerCase().indexOf(q.toLowerCase()) !== -1;
        });
        res.render('salary/index', {salary: data.splice(start,end), n: pages, current: currentPage});
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