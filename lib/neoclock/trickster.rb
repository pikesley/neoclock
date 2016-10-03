module Neoclock
  class Trickster
    def self.shuffle iterations = 64
      iterations.times do
        Clock.time DateTime.strptime(Random.rand(86400).to_s, '%s')
      end
    end
  end
end
