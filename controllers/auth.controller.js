var mysql =require('mysql');
var connection = mysql.createConnection({ // ket noi mysql
    host: "localhost",
    user: "student",
    password: "student",
    database:"dbms"
});


module.exports.login= function(req,res,next){
    res.render('auth/login');
};

module.exports.postLogin= function(req,res){
    var userName = req.body.userName;
    var password =req.body.password;
    var sql ="select * from accounts where user_name= ?";
    connection.query(sql,userName, function(err,result,field){
        var user,password;

        if(result[0] == undefined){
            res.render('auth/login',{
                errors: ['User does not exists'],values: req.body
            });
            return;
        }
        if(password != result[0].password){
            res.render('auth/login',{
                errors: [
                    'Wrong pasword'
                ],
                values: req.body
            });
            return;
        }
        res.cookie('userId', user, {
            signed: true 
        });
        res.redirect('/');
        
    });
}