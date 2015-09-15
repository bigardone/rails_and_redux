fetch = require 'isomorphic-fetch'

module.exports =
  REQUEST_PEOPLE: 'REQUEST_PEOPLE'
  RECEIVE_PEOPLE: 'RECEIVE_PEOPLE'

  requestPeople: (params) ->
    type: @REQUEST_PEOPLE
    pageNumber: params.page
    search: params.search

  fetchPeople: (params = {}) ->
    (dispatch) =>
      dispatch @requestPeople(params)
      fetch(Routes.api_v1_people_path(params))
      .then (req) =>
        req.json()
      .then (json) =>
        dispatch @receivePeople(json)

  receivePeople: (json) ->
    type: @RECEIVE_PEOPLE
    people: json.people
    meta: json.meta


