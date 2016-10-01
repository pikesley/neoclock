module Neoclock
  class Wheel
    attr_reader :leds

    def initialize type:
      @type = type
      @config = Config.instance.config
      @count = @config[type]['pins']
      @on = @config.colours['figure']
      @off = @config.colours['ground']
    end

    def hours hour
      @leds = Wheel.colourise ((hour % 12) * 30), @count
    end

    def minutes minute
      @leds = Wheel.colourise (minute * 6), @count
    end

    def self.intensity angle, count
      list = []
      lit = ((count / 360.0) * angle).ceil
      count.times do |i|
        list[i] = 0
        list[i] = 1 if i == lit
      end

      list
    end

    def self.colourise angle, count
      lamps = intensity angle, count
      lamps.map do |l|
        if l == 1
          Config.instance.config.colours['figure']
        else
          Config.instance.config.colours['ground']
        end
      end
    end
  end
end
