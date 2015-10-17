ResetButton = require '../buttons/reset_button'

module.exports = React.createClass
  displayName: 'NoResults'

  render: ->
    { dispatch } = @props

    <div className="warning">
      <span className="fa-stack">
        <i className="fa fa-meh-o fa-stack-2x"></i>
      </span>
      <h4>No people found...</h4>
      <ResetButton text="Reset filter" styleClass="btn" dispatch={dispatch}/>
    </div>
