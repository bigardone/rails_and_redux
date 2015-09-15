classnames = require 'classnames'
moment = require 'moment'
Link = require('react-router').Link

module.exports = React.createClass
  displayName: 'Person'

  mixins: [React.addons.PureRenderMixin]

  componentWillUnmount: ->
    @app.people.actionCreators.resetCurrentPerson()


  _birthDate: ->
    moment(@props.data.birth_date).format('D MMM YYYY')

  render: ->
    cardClasses = classnames
      'person-detail': true
      female: @props.data.gender == 'female'
      male: @props.data.gender == 'male'

    <div>
      <header>
        <h3>Person detail</h3>
      </header>
      <Link to="home">← Back to people list</Link>
      <div className={cardClasses}>
        <header>
          <img className="avatar" src={@props.data.picture} />
          <h4>{@props.data.first_name} {@props.data.last_name}</h4>
          <ul className="meta">
            <li><i className="fa fa-map-marker"></i> {@props.data.location}</li>
            <li><i className="fa fa-birthday-cake"></i> {@_birthDate()}</li>
          </ul>
        </header>
        <div className="card-body">
          <div className="headline">
            <p>{@props.data.headline}</p>
          </div>
          <ul className="contact-info">
            <li><i className="fa fa-phone"></i> {@props.data.phone_number}</li>
            <li><i className="fa fa-envelope"></i> {@props.data.email}</li>
          </ul>
        </div>
      </div>
    </div>
