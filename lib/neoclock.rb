require 'neoclock/version'
require 'neoclock/wheel'
require 'neoclock/colour'

# http://www.perbang.dk/rgbgradient/

module Neoclock
  def self.alg length, angle
    ((length / 360.0) * angle)
  end
end
