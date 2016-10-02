module Neoclock
  class Clock
    attr_reader :lights

    def initialize options = {}
      @config = Config.instance.config

      @figure = Config.instance.colours[@config.colours['figure']]
      @ground = Config.instance.colours[@config.colours['ground']]

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

      minutes = ((@config.minutes['pins'] / 60.0) * dt.minute).round
      hours = (dt.hour % 12) + @config.minutes['pins']

      @total_size.times do
        @lights.push @ground
      end

      @lights[hours] = @figure
      Clock.minute_block(minutes, @figure, @ground).each_pair do |index, colour|
        @lights[index] = colour
      end

      @lights.each_with_index do |colour, i|
        @rings[i] = PixelPi::Color *colour
      end

      @rings.show
    end

    def self.minute_block pin, figure, ground
      h = {}

      h[pin] = figure

      before = pin - 1
      if before < 0
        before = Config.instance.config.minutes['pins'] - 1
      end
      h[before] = figure

      after = pin + 1
      if after >= Config.instance.config.minutes['pins']
        after = pin - Config.instance.config.minutes['pins'] + 1
      end
      h[after] = figure

      h
    end
  end
end
