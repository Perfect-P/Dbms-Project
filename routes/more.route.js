var express = require('express');
var router = express.Router();
var controller = require('../controllers/more.controller'); 

router.get('/',	controller.index);

module.exports =router;