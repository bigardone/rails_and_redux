merge = require 'lodash/object/merge'
actions = require '../actions'
{ REQUEST_PEOPLE } = require '../constants'

initialState =
  search: ''

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PEOPLE
      search: action.search
      pageNumber: action.pageNumber
    else
      state
