module Neoclock
  class Wheel
    attr_reader :leds

    def initialize options
      @proportion = 1 / 12.0
      @count = options.fetch :count, 12
      @leds = []
    end

    def rotation angle
      lit = ((@count / 360.0) * angle).to_i
      @count.times do |i|
        @leds[i] = 0
        @leds[i] = 1 if i == lit
      end
    end
  end
end
