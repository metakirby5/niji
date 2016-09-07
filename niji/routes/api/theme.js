var express = require('express');

var Theme = require.main.require('./models/theme');

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

module.exports = router;
