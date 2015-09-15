Root = require './containers/root'

window.onload = ->
  React.render <Root />, document.getElementById 'people_list'
