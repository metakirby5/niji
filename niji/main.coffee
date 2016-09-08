express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
bodyParser = require 'body-parser'

# appRoutes = require './routes.app'
apiRoutes = require './routes/api'

app = express()

app.use (req, res, next) ->
  res.setHeader 'Access-Control-Allow-Origin' '*'
  res.setHeader 'Access-Control-Allow-Methods' 'POST, GET, PATCH, DELETE, OPTIONS'
  res.setHeader 'Access-Control-Allow-Headers' 'X-Requested-With,content-type, Authorization'
  next()

# app.use '/' appRoutes
app.use '/api' apiRoutes

module.exports = app
