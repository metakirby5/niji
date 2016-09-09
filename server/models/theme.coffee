mongoose = require 'mongoose'

module.exports = mongoose.model 'Theme', new mongoose.Schema
  name:
    type: String
    required: true
  # author:
  #   type: mongoose.Schema.Types.ObjectId,
  #   ref: 'User'
  #   required: true
  description:
    type: String
    required: true
  target:
    type: String
    required: true
  screenshot:
    type: String
    required: false
  tags:
    type: String[]
    required: false
  yaml:
    type: String
    required: true
