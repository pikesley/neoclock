module Neoclock
  describe Clock do
    context 'show the time' do
      clock = Clock.new

      it 'shows an on-the-hour time' do
        Timecop.freeze DateTime.parse '13:00' do
          clock.time
          expect(clock.lights).to eq [
            [255, 0, 0], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],

            [0, 0, 255], [255, 0, 0], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255]
          ]
        end
      end

      it 'shows a half-past-the-hour time' do
        Timecop.freeze DateTime.parse '09:30' do
          clock.time
          expect(clock.lights[24..-1]).to eq [
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [255, 0, 0], [127, 0, 127], [0, 0, 255]
          ]
        end
      end
    end
  end
end
