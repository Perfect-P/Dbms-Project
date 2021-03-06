var express = require('express');
var router = express.Router();
var controller =require('../controllers/salary.controller');

router.get('/', controller.index);
router.get('/search', controller.search);
router.post('/create', controller.postCreate); //chuyen toi module.exports.postCreate
router.get('/create', controller.create); // chuyen toi module.exports.create
router.get('/:id/edit', controller.edit); //edit
router.post('/:id/edit',controller.postEdit); // gui edit len db
router.get('/:id/delete', controller.delete);//delete

module.exports = router;