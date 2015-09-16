PeopleSearch = require './search'
PersonCard = require './card'
PaginatorSection = require '../paginator/paginator_section'
ResetButton = require '../buttons/reset_button'
actions = require '../../actions'

module.exports = React.createClass
  displayName: 'PeopleSection'

  _handlePageNumberClicked: (pageNumber)->
    { dispatch, search } = @props
    dispatch actions.fetchPeople({search: search, page: pageNumber})

  _renderPeople: ->
    if @props.people.length is 0 then return @_renderNoResultsFound()

    @props.people.map (person) ->
      <PersonCard key={person.id} {...person}/>

  _renderNoResultsFound: ->
    { dispatch } = @props

    <div className="warning">
      <span className="fa-stack">
        <i className="fa fa-meh-o fa-stack-2x"></i>
      </span>
      <h4>No people found...</h4>
      <ResetButton text="Reset filter" styleClass="btn" dispatch={dispatch}/>
    </div>

  render: ->
    { dispatch, search } = @props

    <div>
      <PeopleSearch totalCount={@props.meta.total_count} value={search} dispatch={dispatch} />

      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} pageNumberClicked={@_handlePageNumberClicked}/>

      <div className="cards-wrapper">
        {@_renderPeople()}
      </div>

      <PaginatorSection totalPages={@props.meta.total_pages} currentPage={@props.meta.current_page} pageNumberClicked={@_handlePageNumberClicked}/>
    </div>
