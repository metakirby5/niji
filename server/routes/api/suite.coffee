{Router} = require 'express'
Suite = require.main.require './server/models/suite'

router = Router()

router.post '/suite', (req, res, next) ->
  Suite.find
    name: req.body.name
    (err, doc) ->
      if err
        res.status(404).json
          title: 'An error occurred'
          error: err
      if doc
        res.status(409).json
          title: 'An error occurred'
          error: 'A suite with that name already exists'
  suite = new Suite
    name: req.body.name
    # author: req.body.author
    description: req.body.description
    tags: req.body.tags
    themes: req.body.themes
  suite.save (err, result) ->
    if err
      return res.status(404).json
        title: 'An error occurred'
        error: err
    return res.status(201).json
      message: 'Saved suite'
      obj: result
