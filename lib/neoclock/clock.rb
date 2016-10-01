module Neoclock
  class Clock
    attr_reader :lights

    def initialize options = {}
      @config = Config.instance.config

      @figure = @config.colours['figure']
      @ground = @config.colours['ground']

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

      minutes = ((@config.minutes['pins'] / 60.0) * dt.minute).to_i
      hours = (dt.hour % 12) + @config.minutes['pins']

      step = 0
      while step < @total_size do
        case step
        when minutes
          @lights[step] = @figure
        when hours
          @lights[step] = @figure
        else
          @lights[step] = @ground
        end

        step += 1
      end

      @lights.each_with_index do |colour, i|
        @rings[i] = PixelPi::Color *colour
      end

      @rings.show
    end
  end
end
