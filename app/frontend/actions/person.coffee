fetch = require 'isomorphic-fetch'
{ REQUEST_PERSON, RECEIVE_PERSON } = require '../constants'

module.exports =
  requestPerson: () ->
    type: REQUEST_PERSON

  loadPerson: (id) ->
    (dispatch) =>
      dispatch @requestPerson()

      fetch(Routes.api_v1_person_path(id))
      .then (req) =>
        req.json()
      .then (json) =>
        dispatch @receivePerson(json)

  receivePerson: (json) ->
    type: RECEIVE_PERSON
    person: json.person

