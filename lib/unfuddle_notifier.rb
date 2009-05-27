class UnfuddleNotifier
  TEMPLATE_PATH = File.dirname(__FILE__) + "/../views"
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, ERB.new(File.read("views/ui/panel.html.erb")).result + response.body]
  end
end