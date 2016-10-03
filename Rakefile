require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'timecop'
require 'neoclock'

namespace :clock do
  task :time do
    Neoclock::Clock.time
  end

  task :roll do
    t = 82800
    while t <= 126000
      Timecop.freeze DateTime.strptime(t.to_s, '%s') do
        Neoclock::Clock.time
        t += 60
      end
      sleep 0.05
    end
    Neoclock::Clock.time
  end

  task :shuffle do
    Random.rand(256).times do
      Timecop.freeze DateTime.strptime(Random.rand(86400).to_s, '%s') do
        Neoclock::Clock.time
      end
      sleep 0.05
    end
    Neoclock::Clock.time
  end

  task :swing do
    t = 82800 + 1800
    while t <= 864000
      Timecop.freeze DateTime.strptime(t.to_s, '%s') do
        Neoclock::Clock.time
        t += 3930
      end
      sleep 0.05
    end
    Neoclock::Clock.time
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
