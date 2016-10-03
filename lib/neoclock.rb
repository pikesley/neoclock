require 'pixel_pi'
require 'singleton'
require 'ostruct'
require 'yaml'

require 'neoclock/version'
require 'neoclock/clock'
require 'neoclock/config'
require 'neoclock/neopixels'

module Neoclock
  def self.blender start, stop, sixtieth
    c = []
    start.each_with_index do |component, i|
      c.push intersperse(component, stop[i], sixtieth)
    end
    c
  end

  def self.intersperse first, second, sixtieth
    lower, higher = first, second
    if second < first
      lower, higher = second, first
      sixtieth = 60 - sixtieth
    end
    ((higher - lower) / 60.0 * sixtieth).to_i + lower
  end
end
