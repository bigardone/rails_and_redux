{ connect } = require 'react-redux'
actions = require '../actions'
PeopleSection = require '../components/people/section'

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
      <PeopleSection people={items} meta={meta} dispatch={dispatch} search={search} />
    )

mapStateToProps = (state)->
  people: state.people
  search: state.search

module.exports = connect(mapStateToProps)(AsyncApp)
