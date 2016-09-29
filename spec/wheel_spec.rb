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
          expectations.each_pair do |angle, expectation|
            it "gets #{expectation} for #{angle}" do
              expect(described_class.intensity angle, count).
                to eq expectation
            end
          end
        end
      end
    end

    context 'set colours' do
      test_cases = {
        4 => {
          0 => [
            [255, 0, 0],
            [0, 0, 255],
            [0, 0, 255],
            [0, 0, 255]
          ]
        },
        12 => {
          60 => [
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
        }
      }

      test_cases.each_pair do |count, expectations|
        context "#{count} lights" do
          expectations.each_pair do |angle, expectation|
            it "gets #{expectation} for #{angle}" do
              expect(described_class.colourise angle, count).
                to eq expectation
            end
          end
        end
      end
    end

    context 'set the time' do
      context 'hours' do
        test_cases = {
          12 => {
            4 => [
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
              [0, 0, 255]
            ],
            19 => [
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
              [0, 0, 255]
            ]
          }
        }

        test_cases.each_pair do |count, expectations|
          context "#{count} lights" do
            expectations.each_pair do |hour, expectation|
              it "lights #{expectation} for #{hour} hours" do
                wheel = described_class.new lights: count
                wheel.hours hour
                expect(wheel.leds).to eq expectation
              end
            end
          end
        end
      end

      context 'minutes' do
        test_cases = {
          24 => {
            30 => [
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
              [0, 0, 255],
              [0, 0, 255],
              [0, 0, 255]
            ],
            17 => [
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
          }
        }

        test_cases.each_pair do |count, expectations|
          context "#{count} lights" do
            expectations.each_pair do |minute, expectation|
              it "lights #{expectation} for #{minute} minutes" do
                wheel = described_class.new lights: count
                wheel.minutes minute
                expect(wheel.leds).to eq expectation
              end
            end
          end
        end
      end
    end
  end
end
