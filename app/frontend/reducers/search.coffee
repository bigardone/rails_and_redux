actions = require '../actions'
{ REQUEST_PEOPLE, SET_SEARCH } = require '../constants'

initialState =
  text: ''

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PEOPLE
      Object.assign {}, state, text: action.search

    when SET_SEARCH
      Object.assign {}, state, text: action.search

    else
      state
