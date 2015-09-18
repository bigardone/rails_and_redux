classnames = require 'classnames'
moment = require 'moment'
Link = require('react-router').Link
{ connect } = require 'react-redux'
actions = require '../../actions'


Person = React.createClass
  displayName: 'Person'

  componentDidMount: ->
    { dispatch, params } = @props
    dispatch actions.person.loadPerson params.id

  _birthDate: ->
    moment(@props.person.birth_date).format('D MMM YYYY')

  render: ->
    return false if @props.isLoading

    cardClasses = classnames
      'person-detail': true
      female: @props.person.gender == 'female'
      male: @props.person.gender == 'male'

    <div>
      <header>
        <h3>Person detail</h3>
      </header>
      <Link to="/">← Back to people list</Link>
      <div className={cardClasses}>
        <header>
          <img className="avatar" src={@props.person.picture} />
          <h4>{@props.person.first_name} {@props.person.last_name}</h4>
          <ul className="meta">
            <li><i className="fa fa-map-marker"></i> {@props.person.location}</li>
            <li><i className="fa fa-birthday-cake"></i> {@_birthDate()}</li>
          </ul>
        </header>
        <div className="card-body">
          <div className="headline">
            <p>{@props.person.headline}</p>
          </div>
          <ul className="contact-info">
            <li><i className="fa fa-phone"></i> {@props.person.phone_number}</li>
            <li><i className="fa fa-envelope"></i> {@props.person.email}</li>
          </ul>
        </div>
      </div>
    </div>



mapStateToProps = (state) ->
  person: state.person
  isLoading: state.person.isLoading

module.exports = connect(mapStateToProps)(Person)
