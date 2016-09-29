module Neoclock
  class Clock
    attr_reader :leds

    #LED_COUNT      = 36      # Number of LED pixels.
    LED_PIN        = 18      # GPIO pin connected to the pixels (must support PWM!).
    LED_FREQ_HZ    = 800000  # LED signal frequency in hertz (usually 800khz)
    LED_DMA        = 5       # DMA channel to use for generating signal (try 5)
    LED_BRIGHTNESS = 16      # Scale the brightness of the pixels (0 to 255)
    LED_INVERT     = false   # True to invert the signal (when using NPN transistor level shift)

    def initialize minute_size, hour_size, on, off
      @bighand = Wheel.new count: minute_size, on: on, off: off
      @littlehand = Wheel.new count: hour_size, on: on, off: off

      @lights = PixelPi::Leds.new \
        minute_size + hour_size,
        LED_PIN,
        frequency: LED_FREQ_HZ,
        dma: LED_DMA,
        brightness: LED_BRIGHTNESS,
        invert: LED_INVERT
        #debug: true
    end

    def time
      dt = DateTime.now
      @bighand.minutes dt.minute
      @littlehand.hours dt.hour

      (@littlehand.leds + @bighand.leds).each_with_index do |l, index|
        @lights[index] = l
      end

      @lights.show
    end
  end
end
