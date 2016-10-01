module Neoclock
  describe Clock do
    it 'shows the time' do
      clock = Clock.new

      Timecop.freeze DateTime.parse '1974-06-15T13:00:00+00:00' do
        clock.time
        expect(clock.lights).to eq [
          [255, 0, 0],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [255, 0, 0],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255],
          [0, 0, 255]
        ]
      end
    end
  end
end
