{ RECEIVE_PEOPLE, REQUEST_PEOPLE } = require '../constants'

initialState =
  items: null
  meta: {}
  isLoading: false
  pageNumber: 1

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PEOPLE
      Object.assign {}, state, pageNumber: action.pageNumber

    when RECEIVE_PEOPLE
      newState =
        items: action.people
        meta: action.meta
        isLoading: false

      Object.assign {}, state, newState

    else
      state
