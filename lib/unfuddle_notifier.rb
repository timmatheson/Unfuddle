class UnfuddleNotifier
  include ERB::Utils
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, ERB.new(File.read("../views/ui/panel.html.erb")) + response.body]
  end
end