{ Provider } = require 'react-redux'
configureStore = require '../store/configure_store'
{ Router, RoutingContext } = require 'react-router'
routes = require '../routes'

module.exports = React.createClass
  displayName: 'Root'

  renderRouter: ->
    if @props.routingContext
      <RoutingContext {...@props.routingContext} />
    else
      <Router history={@props.routerHistory}>
        {routes}
      </Router>

  render: ->
    (
      <div>
        <Provider store={@props.store}>
          {@renderRouter()}
        </Provider>
      </div>
    )
