actions = require '../../actions'

module.exports = React.createClass
  displayName: 'ResetButton'

  _handleOnClick: (e) ->
    e.preventDefault()

    { dispatch } = @props
    dispatch actions.fetchPeople(search: '')

  render: ->
    <a className={@props.styleClass} href="#" onClick={@_handleOnClick}>{@props.text}</a>
