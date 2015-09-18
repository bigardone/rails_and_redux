MainLayout = require '../layouts/main'
{ Route } = require 'react-router'
PeopleList = require '../components/people/list'
Person = require '../components/people/person'

module.exports =
  <Route component={MainLayout}>
    <Route name="root" path="/" component={PeopleList} />
    <Route name="person" path="people/:id" component={Person} />
  </Route>
