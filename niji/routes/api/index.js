var express = require('express');
var multer = require('multer');

var Theme = require.main.require('./models/theme');
var Suite = require.main.require('./models/suite');

var router = express.Router();

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

router.post('/suite', function(req, res, next){
  Suite.find({name: req.body.name}, function(err, doc){
    if(err){
      return res.status(404).json({
        title: 'An error occurred',
        error: err
      });
    }
    if(doc){
      return res.status(409).json({
        message: 'A suite with that name already exists'
      });
    }
  });
  if(req.body.wallpaper){
    upload(req, res, function(err){
      if(err){
        res.status(404).json({
          title: 'An error occurred',
          error: err
        });
      }
    });
  }
  var suite = new Suite({
    name: req.body.name,
    description: req.body.description,
    wallpaper: req.body.name,
    tags: req.body.tags,
    yaml: req.body.yaml
  });
  suite.save(function(err, result){
    if(err){
      return res.status(404).json({
        title: 'An error occurred',
        error: err
      });
    }
    res.status(201).json({
      message: 'Saved suite',
      obj: result
    });
  });
});

module.exports = router;
