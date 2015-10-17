merge = require 'lodash/object/merge'

actions = require '../actions'
{ RECEIVE_PEOPLE } = require '../constants'

initialState =
  items: null
  meta: {}
  isLoading: false

module.exports = (state = initialState, action) ->
  switch action.type
    when RECEIVE_PEOPLE
      newState =
        items: action.people
        meta: action.meta
        isLoading: false

      Object.assign {}, state, newState

    else
      state
