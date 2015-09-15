{ createStore, applyMiddleware } = require 'redux'
thunkMiddleware = require 'redux-thunk'
loggerMiddleware = require 'redux-logger'
rootReducer = require '../reducers'

logger = loggerMiddleware
  level: 'info',
  collapsed: true

createStoreWithMiddleware = applyMiddleware(thunkMiddleware, logger)(createStore)

configureStore = (initialState) ->
  createStoreWithMiddleware rootReducer, initialState

module.exports = configureStore
