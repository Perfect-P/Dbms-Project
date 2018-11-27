var express= require('express');
var app = express();
var mysql =require('mysql');
var pug = require('pug'); 
var date = require('date-and-time');
var bodyParser = require('body-parser'); // npm install body-parser --save de doc du lieu tu req.body



app.set('view engine', 'pug');
app.set('views', './views');
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({extended: true})); // for parsing application/x-www-form-urlencoded

var empRoute = require('./routes/employee.route');// require route
var deptRoute =require('./routes/department.route');
var salRoute = require('./routes/salary.route');
var posRoute = require('./routes/position.route');
var eduRoute = require('./routes/education.route');
var tiWoRoute =require('./routes/timeWorking.route');

app.use('/employees', empRoute);
app.use('/departments', deptRoute);
app.use('/salary',salRoute);
app.use('/position', posRoute);
app.use('/education',eduRoute);
app.use('/timeWorking',tiWoRoute);

app.use(express.static(__dirname + "/public"));

app.get('/',function(req,res){// render trang index(trang chu)
  res.render('index');
});

var port =3000;

app.listen(port,function(){
    console.log('Server listening at port: '+ port);
});