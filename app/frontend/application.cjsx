ReactDOM = require 'react-dom'
Root = require './containers/root'
configureStore = require './store/configure_store'
createBrowserHistory = require 'history/lib/createBrowserHistory'

window.onload = ->
  store = configureStore()

  ReactDOM.render <Root routerHistory={createBrowserHistory()} store={store}} />, document.getElementById 'main_wrapper'
