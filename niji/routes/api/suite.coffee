express = require 'express'

Suite = require.main.require './models/suite'

router = express.Router()

router.post '/suite', (req, res, next) ->
  Suite.find
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
  suite = new Suite
    name: req.body.name
    description: req.body.description
    wallpaper: req.body.name
    screenshot: req.body.name
    tags: req.body.tags
    themes: req.body.themes
    # creator: req.body.creator
  suite.save (err, result) ->
    if err
      return res.status 404 .json
        title: 'An error occurred'
        error: err
    return res.status 201 .json
      message: 'Saved suite'
      obj: result
