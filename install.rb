rake_task_copy_path = File.join(RAILS_ROOT, "lib", "tasks", "unfuddle.rake")
unless File.exists?(rake_task_copy_path)
  File.copy(File.join(File.dirname(__FILE__),"lib","tasks", "unfuddke.rake"), rake_task_copy_path)
end