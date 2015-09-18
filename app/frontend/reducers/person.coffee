merge = require 'lodash/object/merge'
actions = require '../actions'
{ REQUEST_PERSON, RECEIVE_PERSON } = require '../constants'

initialState =
  person: {}
  isLoading: false

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PERSON
      isLoading: true
    when RECEIVE_PERSON
      merge action.person, isLoading: false
    else
      state
