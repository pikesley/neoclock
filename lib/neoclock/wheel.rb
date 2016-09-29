module Neoclock
  class Wheel
    attr_reader :leds

    def initialize options
      @range = options.fetch :range, (0..11)
      @proportion = 1 / 12.0
      @count = @range.count
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
