{ Provider } = require 'react-redux'
configureStore = require '../store/configure_store'
AsyncApp = require './async_app'

store = configureStore()

module.exports = React.createClass
  displayName: 'Root'

  render: ->
    (
      <Provider store={store}>
        {() => <AsyncApp />}
      </Provider>
    )
