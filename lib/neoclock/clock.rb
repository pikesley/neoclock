module Neoclock
  class Clock
    attr_reader :leds

    def initialize options = {}
      @config = Config.instance.config

      @minute_size = options.fetch(:minute_size, @config.minutes['pins'])
      @hour_size = options.fetch(:hour_size, @config.hours['pins'])
      @figure = options.fetch(:figure, @config.colours['figure'])
      @ground = options.fetch(:ground, @config.colours['ground'])
      @bighand = Wheel.new lights: @minute_size, on: @figure, ground: @ground
      @littlehand = Wheel.new lights: @hour_size, on: @figure, ground: @ground

      @lights = PixelPi::Leds.new \
        @minute_size + @hour_size,
        @config.led['pin'],
        frequency: @config.led['freq'],
        dma: @config.led['dma'],
        brightness: @config.led['brightness'],
        invert: @config.led['invert']
    end

    def time
      dt = DateTime.now
      @bighand.minutes dt.minute
      @littlehand.hours dt.hour

      (@littlehand.leds + @bighand.leds).each_with_index do |l, index|
        @lights[index] = PixelPi::Color(*l)
      end

      @lights.show
    end
  end
end