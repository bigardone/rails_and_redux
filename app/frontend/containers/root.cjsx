{ Provider } = require 'react-redux'
configureStore = require '../store/configure_store'
{ Router, RoutingContext, Route } = require 'react-router'
AsyncApp = require './async_app'
PeopleList = require '../components/people/list'
Person = require '../components/people/person'

module.exports = React.createClass
  displayName: 'Root'

  renderRouter: ->
    if @props.routingContext
      <RoutingContext {...@props.routingContext} />
    else
      <Router history={@props.routerHistory}>
        <Route name="root" path="/" component={PeopleList} />
        <Route name="person" path="people/:id" component={Person} />
      </Router>

  render: ->
    (
      <div>
        <Provider store={@props.store}>
          {@renderRouter()}
        </Provider>
      </div>
    )
