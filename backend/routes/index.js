var express = require("express");
var router = express.Router();

router.use('/student', require('./student'))
router.use('/professor', require('./professor'))
// router.use('/admin', require('./admin'))
module.exports = router