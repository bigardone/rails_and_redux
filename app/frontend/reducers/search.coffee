merge = require 'lodash/object/merge'
actions = require '../actions'
{ REQUEST_PEOPLE, SET_SEARCH } = require '../constants'

initialState =
  text: ''
  pageNumber: 1

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PEOPLE
      Object.assign {}, state, text: action.search, pageNumber: action.pageNumber

    when SET_SEARCH
      Object.assign {}, state, text: action.search

    else
      state
