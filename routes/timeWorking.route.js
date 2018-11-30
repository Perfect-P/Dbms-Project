var express = require('express');
var router = express.Router();
var controller =require('../controllers/timeWorking.controller');

router.get('/',	controller.index);
<<<<<<< HEAD
// router.get('/create', controller.create);
// router.post('/create', controller.postCreate);
router.get('/search', controller.search);
=======
router.get('/create', controller.create);
router.post('/create', controller.postCreate);
>>>>>>> 7c2aced2217daa26754383083611bdcd89577e93
router.get('/:id/edit', controller.edit); //edit
router.post('/:id/edit', controller.postEdit); // gui edit len db
router.get('/:id/delete', controller.delete);//delete



module.exports = router;