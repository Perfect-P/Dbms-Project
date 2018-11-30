var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
    host: "localhost",
    user: "student",
    password: "student",
    database:"dbms"
});

module.exports.requireAuth = function(req, res, next){
    if(!req.signedCookies.userId){
        res.redirect('/auth/login');
        return;
    }
    
    var sql ="select * from accounts where user_name=?";
    connection.query(sql,req.signedCookies.userId,function(err,result,field){
        if(!result){
            res.redirect('/auth/login');
            return;
        }
        if(result[0] == undefined){
            res.render('auth/login');
        }
        res.locals.user = result[0].user_name;
    });
    next();
}

    // var user = db.get('users').find({
    //     id: req.signedCookies.userId
    // }).value();

    // if(!user){
    //     res.redirect('/auth/login');
    //     return;
    // }

    // res.locals.user = user; //user = db.get ... line 11

    // next();
