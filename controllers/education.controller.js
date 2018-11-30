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
	var sql = "SELECT * from educations";
	connection.query(sql,function(err,result,fields){
		res.render('education/index',{education: result.splice(start,end), n: pages, current: currentPage});
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
    connection.query("select * from educations",
        function(err,result,next){
        if(err) throw err;
        data = result.filter(function(edu){
            return edu.edu_name.toLowerCase().indexOf(q.toLowerCase()) !== -1;
        });
        res.render('education/index', {education: data.splice(start,end), n: pages, current: currentPage});
    });
}

module.exports.create = function(req,res){  // render trang create
    res.render('education/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into educations values(?,?,?,?)',
    [req.body.id,req.body.name,req.body.major,req.body.evaluation],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/education');
    });
}
module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
    var id = req.params.id;
    connection.query("SELECT * FROM educations where edu_id = ?",
        id, 
        function (err, result, fields) {
        if (err){
            console.log(err);
        }
        res.render('education/edit',{education: result});
    });
}
module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
    var id =req.params.id;
    connection.query('call update_edu(?,?,?,?)',
    [id,req.body.name,req.body.major,req.body.evaluation],
        function(err,result,fields){
        if(err) console.log(err)
        res.redirect('/education')
    });
}

module.exports.delete = function(req,res){
    var id =req.params.id;
    connection.query('call delete_edu(?)',id,function(err,result,fields){
        if(err) throw err;
        res.redirect('/education');
    });
}