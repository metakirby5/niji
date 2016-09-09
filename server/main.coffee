express = require 'express'

app = express()

app.use (req, res, next) ->
  res.setHeader 'Access-Control-Allow-Origin',
    '*'
  res.setHeader 'Access-Control-Allow-Methods',
    'POST, GET, PATCH, DELETE, OPTIONS'
  res.setHeader 'Access-Control-Allow-Headers',
    'X-Requested-With,content-type, Authorization'
  next()

module.exports = app
