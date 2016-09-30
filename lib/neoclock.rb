require 'pixel_pi'
require 'singleton'
require 'ostruct'
require 'yaml'

require 'neoclock/version'
require 'neoclock/wheel'
require 'neoclock/clock'
require 'neoclock/config'

# http://www.perbang.dk/rgbgradient/

module Neoclock
  def self.alg length, angle
    ((length / 360.0) * angle)
  end
end
