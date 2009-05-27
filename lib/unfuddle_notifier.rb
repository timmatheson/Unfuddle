class UnfuddleNotifier
  def initialize(app)
    @app = app
  end
  
  def call(env)
    @session = Unfuddle::Session.new
    @project = Unfuddle::Project.find(:one, :from => "/projects/20935")
    @tickets = @project.tickets
    status, headers, response = @app.call(env)
    [status, headers, "<div style='background-color: blue; color: white; font-weight: bold;'>
      #{@project.title} has #{@tickets.size} tickets</div>" + response.body]
  end
end