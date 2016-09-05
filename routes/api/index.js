var express = require('express');
var multer = require('multer');

var router = express.Router();
var storage =   multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, './uploads');
  },
  filename: function (req, file, callback) {
    callback(null, req.body.name);
  }
});
var upload = multer({
  storage: storage,
  fileFilter: function(req, file, callback){
    if(file.mimetype.match(/image\/.+/)){
      callback(null, true);
    }
    else{
      callback(null, false);
    }
  }
}).single('screenshot');

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
      if(err){
        res.status(404).json({
          title: 'An error occurred',
          error: err
        });
      }
    });
  }
  var theme = new Theme({
    name: req.body.name,
    description: req.body.description,
    target: req.body.target,
    tags: req.body.tags,
    yaml: req.body.yaml
  });
  theme.save(function(err, result){
    if(err){
      return res.status(404).json({
        title: 'An error occurred',
        error: err
      });
    }
    res.status(201).json({
      message: 'Saved theme',
      obj: result
    });
  });
});

module.exports = router;
