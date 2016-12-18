require "bundler/gem_tasks"

task :default => :spec

task :play do
  sh "ruby ./bin/console"
end

task :test do
  sh "rspec ./spec/game_spec.rb --format doc"  
end