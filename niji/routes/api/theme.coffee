express = require 'express'

Theme = require.main.require './models/theme'

router = express.Router()

router.post '/theme', (req, res, next) ->
  Theme.find
    name: req.body.name
    (err, doc) ->
      if err
        res.status 404 .json
          title: 'An error occurred'
          error: err
      if doc
        res.status 409 .json
          title: 'An error occurred'
          error: 'A suite with that name already exists'
  theme = new Theme
    name: req.body.name
    description: req.body.description
    target: req.body.target
    tags: req.body.tags
    yaml: req.body.yaml
    # author: req.body.author
  theme.save (err, result) ->
    if err
      return res.status 404 .json
        title: 'An error occurred'
        error: err
    return res.status 201 .json
      message: 'Saved theme'
      obj: result
