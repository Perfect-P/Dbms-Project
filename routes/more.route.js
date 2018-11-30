var express = require('express');
var router = express.Router();
var controller = require('../controllers/more.controller'); 

router.get('/',controller.index);
router.get('/day_worked', controller.day_worked);
router.get('/seid', controller.sum_emp_in_dept);
router.get('/sum_emp', controller.sum_emp);
router.get('/emp_eval', controller.emp_eval);

module.exports =router;