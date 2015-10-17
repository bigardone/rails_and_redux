actions = require '../../actions'
ResetButton = require '../buttons/reset_button'
ReactDOM = require 'react-dom'

module.exports = React.createClass
  displayName: 'PeopleSearch'

  _handleOnSubmit: (e) ->
    e.preventDefault()
    { dispatch } = @props
    dispatch actions.people.fetchPeople(search: @refs.search.value.trim())

  _handleOnChange: (e) ->
    @props.onSearchKeyUp @refs.search.value

  _personText: (count) ->
    if count > 1 then 'people' else 'person'

  _renderResetButton: ->
    return false unless @props.search.length != 0

    { dispatch } = @props
    <ResetButton text="Reset filter" styleClass="reset" dispatch={dispatch} />

  render: ->
    count = @props.totalCount
    personText = @_personText(count)
    overviewTitle = if @props.totalCount > 0 then "#{count} #{personText} found"

    <div className="filter-wrapper">
      <div className="overview-wrapper">
        <h3>{overviewTitle}</h3>
        &nbsp;
      </div>
      <div className="form-wrapper">
        <form onSubmit={@_handleOnSubmit}>
          {@_renderResetButton()}
          <input ref="search" placeholder="Search people..." type="search" onChange={@_handleOnChange} value={@props.search}/>
        </form>
      </div>
    </div>
