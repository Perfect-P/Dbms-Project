var express = require('express');
var router = express.Router();
var controller = require('../controllers/more.controller'); 

router.get('/index',controller.index);
//router.post('/', controller.postDayWorked);
router.post('/index', controller.postIndex);

module.exports =router;