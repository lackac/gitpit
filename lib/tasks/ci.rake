namespace :build do
  
  desc "Builds the app."
  task :all do
    Rake::Task["cucumber:all"].invoke
    Rake::Task["spec"].invoke
  end

end