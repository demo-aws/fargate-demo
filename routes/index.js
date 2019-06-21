var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'AWS summit 2019!', success: req.session.success, errors: req.session.errors });
  req.session.errors = null;
});

router.get('/health', require('express-healthcheck')());

module.exports = router;
