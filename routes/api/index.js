var express = require('express');
var multer = require('multer');
var mmm = require('mmmagic');

var router = express.Router();
var storage =   multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, './uploads');
  },
  filename: function (req, file, callback) {
    callback(null, req.body.name);
  }
});
var upload = multer({storage : storage}).single('screenshot');
var Magic = mmm.Magic;
var magic = new Magic(mmm.MAGIC_MIME_TYPE);
// magic.detectFile('example.png', function(err, result) {
//     if (err) throw err;
//     console.log(result);
// });

var authRoutes = require('./auth');

router.use('/auth', authRoutes);

router.post('/theme', function(req, res, next){
  Theme.find({name: req.body.name}, function(err, doc){
    if(err){
      return res.status(404).json({
        title: 'An error occurred',
        error: err
      });
    }
    if(doc){
      return res.status(409).json({
        message: 'A theme with that name already exists'
      });
    }
  });
  if(req.body.screenshot){
    upload(req, res, function(err){
      res.status(404).json({
        title: 'An error occurred',
        error: err
      });
    });
  }
});

module.exports = router;
