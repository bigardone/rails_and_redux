{ REQUEST_PERSON, RECEIVE_PERSON } = require '../constants'

initialState =
  person: {}
  isLoading: false

module.exports = (state = initialState, action) ->
  switch action.type
    when REQUEST_PERSON
      Object.assign {}, state, isLoading: true

    when RECEIVE_PERSON
      Object.assign {}, state, action.person, isLoading: false

    else
      state
