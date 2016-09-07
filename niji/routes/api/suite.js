var express = require('express');

var Suite = require.main.require('./models/suite');

var router = express.Router();

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
