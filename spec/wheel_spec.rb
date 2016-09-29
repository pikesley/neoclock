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
            PixelPi::Color(255, 0, 0),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255)
          ]
        },
        12 => {
          60 => [
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(255, 0, 0),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255),
            PixelPi::Color(0, 0, 255)
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

    context 'get the angle for the time' do
      context 'hours' do
        test_cases = {
          0 => 0,
          5 => 150,
          19 => 210
        }

        test_cases.each_pair do |hour, angle|
          it "gets #{angle} degrees for #{hour} hours" do
            expect(described_class.hours hour).to eq angle
          end
        end
      end

      context 'minutes' do
        test_cases = {
          10 => 60,
          25 => 150,
          53 => 318
        }

        test_cases.each_pair do |minute, angle|
          it "gets #{angle} degrees for #{minute} minutes" do
            expect(described_class.minutes minute).to eq angle
          end
        end
      end
    end

#    context 'set the time' do
#      context 'hours' do
#        test_cases = {
#          12 => {
#            4 => [
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(255, 0, 0),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255),
#              PixelPi::Color(0, 0, 255)
#            ]
#          }
#        }
#
#        test_cases.each_pair do |count, expectations|
#          context "#{count} lights" do
#            expectations.each_pair do |hour, expectation|
#              it "gets #{expectation} for #{hour} hours" do
#                expect(described_class.hours hour, count).
#                  to eq expectation
#              end
#            end
#          end
#        end
#      end
#    end
  end
end
