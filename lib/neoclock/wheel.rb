module Neoclock
  class Wheel
    attr_reader :leds
    
    def initialize options
      @range = options.fetch(:range, [0, 11])
      @count = @range.count
      @colour = options.fetch(:colour, [255, 0, 0])
      @off_colour = options.fetch(:off_colour, [0, 0, 255])
      @leds = []
    end

    def rotation angle
      case angle
      when 0
        @leds[0] = @colour
        @leds[@count / 2] = @off_colour
      when 180
        @leds[0] = @off_colour
        @leds[@count / 2] = @colour
      end
    end
  end
end
