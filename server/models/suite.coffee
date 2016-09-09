mongoose = require 'mongoose'

module.exports = mongoose.model 'Suite', new mongoose.Schema
  name:
    type: String
    required: true
  # author:
  #   type: mongoose.Schema.Types.ObjectId
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
