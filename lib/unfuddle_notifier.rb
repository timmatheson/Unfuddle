class UnfuddleNotifier
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, File.readlines("../views/ui/panel.html.erb") + response.body]
  end
end