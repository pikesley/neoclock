module Neoclock
  class Bracketer < Array
    def initialize pin, length
      first = pin - 1
      if first < 0
        first = length - 1
      end
      self.push first

      self.push pin

      last = (pin + 1) % length
      self.push last

      self.sort!
    end
  end
end
