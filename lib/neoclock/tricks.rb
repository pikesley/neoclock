module Neoclock
  class Clock
    def self.shuffle iterations = 64
      iterations.times do
        self.time DateTime.strptime(Random.rand(86400).to_s, '%s')
      end

      self.time
    end
  end
end
