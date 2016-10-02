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
      sleep 0.05
    end
    clock.time
  end

  task :shuffle do
    clock = Neoclock::Clock.new
    Random.rand(256).times do
      Timecop.freeze DateTime.strptime(Random.rand(86400).to_s, '%s') do
        clock.time
      end
      sleep 0.05
    end
    clock.time
  end

  task :swing do
    clock = Neoclock::Clock.new
    t = 82800 + 1800
    while t <= 864000
      Timecop.freeze DateTime.strptime(t.to_s, '%s') do
        clock.time
        t += 3930
      end
      sleep 0.05
    end    
    clock.time
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
