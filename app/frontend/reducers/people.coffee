constants = require '../constants'

initialState =
  people: null
  meta: {}
  search: ''
  isLoading: false
  pageNumber: 1

module.exports = (state = initialState, action) ->
  switch action.type
    when constants.REQUEST_PEOPLE
      Object.assign {}, state, pageNumber: action.pageNumber, search: action.search

    when constants.SET_SEARCH
      Object.assign {}, state, search: action.search

    when constants.RECEIVE_PEOPLE
      newState =
        people: action.people
        meta: action.meta
        isLoading: false

      Object.assign {}, state, newState

    else
      state
