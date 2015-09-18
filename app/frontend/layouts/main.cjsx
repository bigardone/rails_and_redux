module.exports = React.createClass
  displayName: 'MainLayout'

  render: ->
    <section>
      <header>
        <h1>Rails and Redux: A real use case</h1>
      </header>
      {@props.children}
    </section>
