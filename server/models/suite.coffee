{Schema} = require 'mongoose'

module.exports = connection.model 'Suite', new Schema
  name:
    type: String
    required: true
  # author:
  #   type: Schema.Types.ObjectId
  #   ref: 'User'
  #   required: true
  description:
    type: String
    required: true
  wallpaper:
    type: String
    required: false
  screenshot:
    type: String
    required: false
  tags:
    type: String[]
    required: false
  themes:
    type: Schema.Types.ObjectId[]
    ref: 'Theme'
    required: true
