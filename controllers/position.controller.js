var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
	host: "localhost",
	user: "root",
	database:"dbms"
});

module.exports.index = function(req,res){
	var page = parseInt(req.query.page) || 1;
    var currentPage =[page];
    var pages =[page,page+1,page+2];
    var perPage =5;
    var start = (page -1)*perPage;
    var end = page*perPage;
	var sql = "SELECT * from positions";
	connection.query(sql,function(err,result,fields){
		if(err) throw err
		res.render('position/index', { positions: result.splice(start, end), n: pages, current: currentPage });
	});
}

module.exports.create = function(req,res){  // render trang create
    res.render('position/create');
}

module.exports.postCreate = function(req,res){// them nhan vien vao
    connection.query('insert into positions values(?,?,?,?)',
    [req.body.id,req.body.name],
    	function(err,result,next){
     	if(err){
     		console.log(err);
     	}
    	res.redirect('/position');
    });
}
module.exports.edit = function(req,res){ // goi procedure trong mysql va chinh sua database
    var id = req.params.id;
    connection.query("SELECT * FROM positions where pos_id = ?",
        id, 
        function (err, result, fields) {
        if (err){
            console.log(err);
        }
        res.render('position/edit',{positions: result});
    });
}
module.exports.postEdit = function(req,res){// submit thong tin da chinh sua
    var id =req.params.id;
    connection.query('call update_pos(?,?)',
    [id,req.body.name],
        function(err,result,fields){
        if(err) console.log(err)
        res.redirect('/position');
    });
}
module.exports.delete = function(req,res){
    var id =req.params.id;
    connection.query('call delete_pos(?)',id,function(err,result,fields){
        if(err) throw err;
        res.redirect('/position');
    });
}

