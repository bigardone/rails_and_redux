{ combineReducers } = require 'redux'
merge = require 'lodash/object/merge'

actions = require '../actions'

initialState =
  items: null
  meta: {}
  search: ''
  person: {}
  isLoading: false

people = (state = initialState, action) ->
  switch action.type
    when actions.RECEIVE_PEOPLE
      items: action.people
      meta: action.meta
      isLoading: false
    else
      state

search = (state = initialState, action) ->
  switch action.type
    when actions.REQUEST_PEOPLE
      search: action.search
      pageNumber: action.pageNumber
    else
      state

person = (state = initialState, action) ->
  switch action.type
    when actions.REQUEST_PERSON
      isLoading: true
    when actions.RECEIVE_PERSON
      person: action.person
      isLoading: false
    else
      state

module.exports = combineReducers
  people: people
  search: search
  person: person
