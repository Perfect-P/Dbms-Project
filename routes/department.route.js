var express = require('express');
var router = express.Router(); 
var controller = require('../controllers/department.controller');

router.get('/', controller.index);
router.post('/create', controller.postCreate); //chuyen toi module.exports.postCreate
router.get('/create', controller.create); // chuyen toi module.exports.create


module.exports =router;