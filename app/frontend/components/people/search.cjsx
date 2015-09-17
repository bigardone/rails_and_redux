actions = require '../../actions'
ResetButton = require '../buttons/reset_button'
ReactDOM = require 'react-dom'

module.exports = React.createClass
  displayName: 'PeopleSearch'

  mixins: [
    require 'react-addons-linked-state-mixin'
  ]

  getInitialState: ->
    searchLength: 0
    value: ''

  componentWillReceiveProps: (nextProps) ->
    @setState
      value: nextProps.value
      searchLength: if nextProps.value then nextProps.value.length else 0

  _handleOnSubmit: (e) ->
    e.preventDefault()
    { dispatch } = @props
    dispatch actions.fetchPeople(search: @refs.search.value.trim())

  _handleSearchOnKeyup: (e) ->
    @setState
      searchLength: @refs.search.value.length

  _personText: (count) ->
    if count > 1 then 'people' else 'person'

  _renderResetButton: ->
    return false unless @state.searchLength != 0

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
          <input ref="search" placeholder="Search people..." type="search" onKeyUp={@_handleSearchOnKeyup} valueLink={@linkState('value')}/>
        </form>
      </div>
    </div>
