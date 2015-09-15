Router = require 'react-router'
Route = Router.Route
Person = require './flux/components/people/person'

module.exports = [
  <Route name="home" path="/" handler={require './flux/components/people/people_section'} />
  <Route name="person" path="people/:id" handler={Person} />
]
