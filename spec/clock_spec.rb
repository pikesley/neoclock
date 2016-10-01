module Neoclock
  describe Clock do
    context 'show the time' do
      clock = Clock.new

      it 'shows an on-the-hour time' do
        Timecop.freeze DateTime.parse '13:00' do
          clock.time
          expect(clock.lights).to eq [
            [255, 0, 0], [255, 0, 0], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [0, 0, 255],
            [0, 0, 255], [0, 0, 255], [255, 0, 0],

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
            [255, 0, 0], [0, 0, 255], [0, 0, 255]
          ]

          expect(clock.lights[11..13]).to eq [
            [255, 0, 0],
            [255, 0, 0],
            [255, 0, 0]
          ]
        end
      end

      context 'edge cases' do
        it 'handles on-the-hour' do
          Timecop.freeze DateTime.parse '09:00' do
            clock.time
            expect(clock.lights[23]).to eq [255, 0, 0]
            expect(clock.lights[0]).to eq [255, 0, 0]
            expect(clock.lights[1]).to eq [255, 0, 0]
          end
        end
      end

      context 'minute block' do
        it 'handles the easy case' do
          expect(
            Clock.minute_block 12, [255, 0, 0], [0, 0, 255]
          ).to eq (
            {
              11 => [255, 0, 0],
              12 => [255, 0, 0],
              13 => [255, 0, 0]
            }
          )
        end

        it 'handles the on-the-hour case' do
          expect(
            Clock.minute_block 0, [255, 0, 0], [0, 0, 255]
          ).to eq (
            {
              23 => [255, 0, 0],
              0  => [255, 0, 0],
              1  => [255, 0, 0]
            }
          )
        end

        it 'handles the just-before-the-hour case' do
          expect(
            Clock.minute_block 23, [255, 0, 0], [0, 0, 255]
          ).to eq (
            {
              22 => [255, 0, 0],
              23 => [255, 0, 0],
              0  => [255, 0, 0]
            }
          )
        end
      end
    end
  end
end
