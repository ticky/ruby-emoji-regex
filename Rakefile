require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Regenerate the lib/*.rb files"
task :regenerate do
  exec "script/regenerate"
end
