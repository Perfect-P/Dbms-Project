var express = require('express');
var router = express.Router();
var controller = require('../controllers/employee.controller'); // <=> import file employee.controller.js
var validate = require('../validate/employee.validate');

router.get('/', controller.index); // chuyen toi module.exports.index
//router.get('/employees', controller.main);
router.get('/search', controller.search); // chuyen toi module.exports.search
router.post('/create',validate.postCreate, controller.postCreate); //chuyen toi module.exports.postCreate
router.get('/create', controller.create); // chuyen toi module.exports.create
router.get('/:id',controller.getID); // view user 
router.get('/:id/edit', controller.edit); //edit
router.post('/:id/edit',controller.postEdit); // gui edit len db
router.get('/:id/delete', controller.delete);//delete


module.exports =router;