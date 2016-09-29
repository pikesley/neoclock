module Neoclock
  describe Wheel do
    context 'set intensities' do
      test_cases = {
        4 => {
          0   => [1, 0, 0, 0],
          90  => [0, 1, 0, 0],
          180 => [0, 0, 1, 0],
          270 => [0, 0, 0, 1]
        },
        12 => {
          0   => [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          30  => [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          60  => [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          90  => [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
          180 => [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
          270 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
          330 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
        }
      }

      test_cases.each_pair do |count, expectations|
        context "#{count} lights" do
          wheel = described_class.new count: count
          expectations.each_pair do |angle, expectation|
            it "gets #{expectation} for #{angle}" do
              wheel.rotation angle
              expect(wheel.leds).to eq expectation
            end
          end
        end
      end
    end

  end
end
