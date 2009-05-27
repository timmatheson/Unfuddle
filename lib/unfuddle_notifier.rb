class UnfuddleNotifier
  TEMPLATE_PATH = File.dirname(__FILE__) + "/../views"
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, File.readlines(File.join(TEMPLATE_PATH,"ui","panel.html.erb")) + response.body]
  end
end