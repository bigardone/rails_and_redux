{ combineReducers } = require 'redux'

module.exports = combineReducers
  people: require './people'
  search: require './search'
  person: require './person'
