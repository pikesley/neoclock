module Neoclock
  class Clock
    attr_reader :lights

    def initialize options = {}
      @config = Config.instance.config

      @total_size = @config.minutes['pins'] + @config.hours['pins']

      @rings = PixelPi::Leds.new \
        @total_size,
        @config.led['pin'],
        frequency: @config.led['freq'],
        dma: @config.led['dma'],
        brightness: @config.led['brightness'],
        invert: @config.led['invert']
    end

    def time
      dt = DateTime.now
      @lights = []

      lit = [
        ((@config.minutes['pins'] / 60.0) * dt.minute).to_i,
        (dt.hour % 12) + @config.minutes['pins']
      ]

      @total_size.times do |i|
        if lit.include? i
          @lights.push @config.colours['figure']
        else
          @lights.push @config.colours['ground']
        end
      end

      @lights.each_with_index do |colour, i|
        @rings[i] = PixelPi::Color(*colour)
      end

      @rings.show
    end
  end
end
