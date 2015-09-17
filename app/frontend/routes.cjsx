Router = require 'react-router'
Route = Router.Route
PeopleList = require './components/people/list'
Person = require './components/people/person'

module.exports = [
  <Route name="home" path="/" handler={PeopleList} />
  <Route name="person" path="people/:id" handler={Person} />
]
