require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'timecop'
require 'neoclock'

namespace :clock do
  task :time do
    clock = Neoclock::Clock.new
    clock.time
  end

  task :roll do
    clock = Neoclock::Clock.new
    t = 82800
    while t <= 126000
      Timecop.freeze DateTime.strptime(t.to_s, '%s') do
        clock.time
        t += 60
      end
      sleep 0.001
    end
    clock.time
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
