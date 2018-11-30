var express = require('express');
var router = express.Router();
var controller =require('../controllers/timeWorking.controller');

router.get('/',	controller.index);
// router.get('/create', controller.create);
// router.post('/create', controller.postCreate);
router.get('/search', controller.search);
router.get('/:id/edit', controller.edit); //edit
router.post('/:id/edit',controller.postEdit);
router.get('/:id/delete', controller.delete);


module.exports = router;