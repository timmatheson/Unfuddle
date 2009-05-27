class UnfuddleNotifier
  def initailize(app)
    @app = app
  end
  
  def call
    [200, {"Content-Type" => "text/html"}, "Hello from rack"]
  end
end