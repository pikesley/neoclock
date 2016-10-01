require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'neoclock'

namespace :clock do
  task :time do
    clock = Neoclock::Clock.new
    clock.time
  end

  task :roll do
    clock = Neoclock::Clock.new
    clock.roll
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
