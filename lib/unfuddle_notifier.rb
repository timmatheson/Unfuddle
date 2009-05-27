class UnfuddleNotifier
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, "<div style='background-color: green;'>foobar</div>" + response.body]
  end
end