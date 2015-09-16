{ connect } = require 'react-redux'
actions = require '../actions'
PeopleList = require '../components/people/list'

AsyncApp = React.createClass
  displayName: 'AsyncApp'

  componentDidMount: ->
    { dispatch } = @props
    dispatch actions.fetchPeople()

  render: ->
    { items, meta } = @props.people
    { search } = @props.search
    { dispatch } = @props

    (
      <PeopleList people={items} meta={meta} dispatch={dispatch} search={search} />
    )

mapStateToProps = (state)->
  people: state.people
  search: state.search

module.exports = connect(mapStateToProps)(AsyncApp)
