module Neoclock
  describe Wheel do
    context 'set colours' do
      context 'with 2 lamps' do
        wheel = described_class.new range: (0..1)

        specify '0 degrees' do
          wheel.rotation 0
          expect(wheel.leds[0]).to eq [255, 0, 0]
          expect(wheel.leds[1]).to eq [0, 0, 255]
        end

        specify '180 degrees' do
          wheel.rotation 180
          expect(wheel.leds[0]).to eq [0, 0, 255]
          expect(wheel.leds[1]).to eq [255, 0, 0]
        end
      end

      context 'with 4 lamps' do
        wheel = described_class.new range: (0..3)

        specify '0 degrees' do
          wheel.rotation 0
          expect(wheel.leds[0]).to eq [255, 0, 0]
        #  expect(wheel.leds[1]).to eq [127, 0, 127]
          expect(wheel.leds[2]).to eq [0, 0, 255]
        #  expect(wheel.leds[3]).to eq [127, 0, 127]
        end

        specify '180 degrees' do
          wheel.rotation 180
          expect(wheel.leds[0]).to eq [0, 0, 255]
          expect(wheel.leds[2]).to eq [255, 0, 0]
        end
      end
    end
  end
end
