var express = require('express');
var router = express.Router();
var controller =require('../controllers/position.controller');

router.get('/',	controller.index);
router.get('/search', controller.search);
router.get('/create', controller.create);
router.post('/create', controller.postCreate);
router.get('/:id/edit', controller.edit); //edit
router.post('/:id/edit', controller.postEdit); // gui edit len db
router.get('/:id/delete', controller.delete);//delete


module.exports = router;