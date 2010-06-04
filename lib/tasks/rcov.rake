require 'cucumber/rake/task'
require 'rspec/core'
require 'rspec/core/rake_task'

namespace :rcov do

  NEW_FILE_MARKER =  ("=" * 80) + "\n"
  @rcov_opts = %w(--rails --no-html -n --profile --sort coverage --exclude osx\/objc,gems\/,spec\/,features\/ --aggregate coverage/coverage.data)
  
  Cucumber::Rake::Task.new(:cucumber) do |t|    
    t.rcov = true
    t.rcov_opts = ""
    t.rcov_opts = @rcov_opts
    t.rcov_opts << %[-o "coverage"]
  end
  
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "./spec/**/*_spec.rb"
    t.rcov = true
    t.rcov_opts = ""
    t.rcov_opts = @rcov_opts
  end

  desc "Run both specs and features to generate aggregated coverage"
  task :all do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber"].invoke
    Rake::Task["rcov:spec"].invoke
  end
  
end
