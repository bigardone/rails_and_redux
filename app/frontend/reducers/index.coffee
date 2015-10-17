{ combineReducers } = require 'redux'

module.exports = combineReducers
  people: require './people'
  person: require './person'
