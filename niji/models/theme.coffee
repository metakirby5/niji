mongoose = require 'mongoose'
Schema = mongoose.Schema

themeSchema = new Schema
  name:
    type: String
    required: true
  description:
    type: String
    required: true
  target:
    # urxvt, xterm, termite, etc.
    type: String
    required: true
  tags:
    type: String[]
    required: false
  yaml:
    type: String
    required: true
  # author:
  #   type: mongoose.Schema.Types.ObjectId,
  #   ref: 'User'
  #   required: true
  ## This is commented out until we have a User schema

module.exports = connection.model 'Theme', themeSchema
