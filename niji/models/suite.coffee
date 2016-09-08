mongoose = require 'mongoose'
Schema = mongoose.Schema

Theme = require './theme'

suiteSchema = new Schema
  name:
    type: String,
    required: true
  description:
    type: String,
    required: true
  wallpaper:
    type: String,
    required: false
  screenshot:
    type: String,
    required: false
  tags:
    type: String[],
    required: false
  themes:
    type: mongoose.Schema.Types.ObjectId[],
    ref: 'Theme',
    required: true
  # creator:
  #   type: mongoose.Schema.Types.ObjectId,
  #   ref: 'User',
  #   required: true
  #
  ## This is commented out until we have a User schema

module.exports = connection.model 'Suite' suiteSchema
