module Neoclock
  class Clock
    attr_reader :leds

    ON =  [255, 0, 0]
    OFF = [0, 0, 255]

    def initialize options
    #  @proportion = 1 / 12.0
    #  @count = options.fetch :count, 12
    #  @on = options.fetch :on, [255, 0, 0]
    #  @off = options.fetch :off, [0, 0, 255]
    #  @leds = []
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
          PixelPi::Color(*on)
        else
          PixelPi::Color(*off)
        end
      end
    end

    def self.hours hour
      (hour % 12) * 30
    end

    def self.minutes minute
      minute * 6
    end
  end
end
