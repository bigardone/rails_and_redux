classnames = require 'classnames'
moment = require 'moment'
{ Link } = require('react-router')

module.exports = React.createClass
  displayName: 'PersonCard'

  _birthDate: ->
    moment(@props.birth_date).format('D MMM YYYY')

  render: ->
    cardClasses = classnames
      card: true
      female: @props.gender == 'female'
      male: @props.gender == 'male'

    <div className={cardClasses}>
      <header>
        <div className="avatar-wrapper">
          &nbsp;
          <Link to={"/people/#{@props.id}"}>
            <img className="avatar" src={@props.picture} />
          </Link>
        </div>
        <div className="info-wrapper">
          <h4>{@props.first_name} {@props.last_name}</h4>
          <ul className="meta">
            <li><i className="fa fa-map-marker"></i> {@props.location}</li>
            <li><i className="fa fa-birthday-cake"></i> {@_birthDate()}</li>
          </ul>
        </div>
      </header>
      <div className="card-body">
        <div className="headline">
          <p>{@props.headline}</p>
        </div>
        <ul className="contact-info">
          <li><i className="fa fa-phone"></i> {@props.phone_number}</li>
          <li><i className="fa fa-envelope"></i> {@props.email}</li>
        </ul>
      </div>
    </div>
