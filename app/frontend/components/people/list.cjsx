PeopleSearch = require './search'
PersonCard = require './card'
PaginatorSection = require '../paginator/paginator_section'
NoResults = require './no_results'
{ connect } = require 'react-redux'
actions = require '../../actions'

List = React.createClass
  displayName: 'PeopleSection'

  componentDidMount: ->
    @_fetchPeople()

  _fetchPeople: (pageNumber = @props.pageNumber)->
    { dispatch, search } = @props
    dispatch actions.people.fetchPeople({search: search, page: pageNumber})

  _renderPeople: ->
    if @props.people.length is 0 then return <NoResults dispatch={@props.dispatch} />

    @props.people.map (person) ->
      <PersonCard key={person.id} {...person}/>

  _handleSearchKeyup: (search) ->
    { dispatch } = @props.
    dispatch actions.people.setSearch search

  render: ->
    return false unless @props.people?

    { dispatch, search } = @props

    <div>
      <PeopleSearch search={@props.search} totalCount={@props.meta.total_count} dispatch={dispatch} onSearchKeyUp={@_handleSearchKeyup}/>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} pageNumberClicked={@_fetchPeople}/>
      <div className="cards-wrapper">
        {@_renderPeople()}
      </div>
      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} pageNumberClicked={@_fetchPeople}/>
    </div>

mapStateToProps = (state) ->
  people: state.people.items
  meta: state.people.meta
  pageNumber: state.people.pageNumber
  search: state.search.text

module.exports = connect(mapStateToProps)(List)

