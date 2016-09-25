require 'date'

begin
  require "pixel_pi"
rescue LoadError
  lib = File.expand_path('../../lib', __FILE__)
  raise if $LOAD_PATH.include?(lib)
  $LOAD_PATH.unshift(lib)
  retry
end

LED_COUNT      = 36       # Number of LED pixels.
LED_PIN        = 18      # GPIO pin connected to the pixels (must support PWM!).
LED_FREQ_HZ    = 800000  # LED signal frequency in hertz (usually 800khz)
LED_DMA        = 5       # DMA channel to use for generating signal (try 5)
LED_BRIGHTNESS = 255     # Scale the brightness of the pixels (0 to 255)
LED_INVERT     = false   # True to invert the signal (when using NPN transistor level shift)

clock = PixelPi::Leds.new \
    LED_COUNT, LED_PIN,
    :frequency  => LED_FREQ_HZ,
    :dma        => LED_DMA,
    :brightness => LED_BRIGHTNESS,
    :invert     => LED_INVERT,
    :debug      => true


loop do
  clock.clear.show
  dt = DateTime.now
  hours = (dt.hour % 12) + 24
  minutes = (dt.minute / 2.5).to_i
  puts "#{dt.hour}:#{dt.minute} - #{hours}:#{minutes}"

  LED_COUNT.times do |i|
    clock[i] = PixelPi::Color(0, 0, 0)
  end

  clock[hours] = PixelPi::Color(250, 129, 0)
  clock[minutes] = PixelPi::Color(250, 129, 0)
  clock.show
  sleep 60
end
