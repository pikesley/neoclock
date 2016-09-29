module Neoclock
  describe Clock do
    it 'shows the time' do
      clock = Clock.new 24, 12, [255, 0, 0], [0, 0, 255]

      Timecop.freeze DateTime.parse '1970-01-01 13:00' do
        clock.time 
      end
    end
  end
end
