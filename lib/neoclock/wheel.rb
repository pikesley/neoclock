module Neoclock
  class Wheel
    attr_reader :leds

    ON =  [255, 0, 0]
    OFF = [0, 0, 255]

    def initialize options
      @count = options.fetch :lights, 12
      @on = options.fetch :on, ON
      @off = options.fetch :off, OFF
    end

    def hours hour
      @leds = Wheel.colourise ((hour % 12) * 30), @count, @on, @off
    end

    def minutes minute
      @leds = Wheel.colourise (minute * 6), @count, @on, @off
    end

    def self.intensity angle, count
      list = []
      lit = ((count / 360.0) * angle).to_i
      count.times do |i|
        list[i] = 0
        list[i] = 1 if i == lit
      end

      list
    end

    def self.colourise angle, count, on = ON, off = OFF
      lamps = intensity angle, count
      lamps.map do |l|
        if l == 1
          on
        else
          off
        end
      end
    end
  end
end
