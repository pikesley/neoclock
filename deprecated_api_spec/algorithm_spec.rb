describe 'Algorithm' do
  test_cases = {
    4 => [
      [0, 0],
      [90, 1],
      [180, 2],
      [270, 3]
    ],
    8 => [
      [0, 0],
      [90, 2],
      [180, 4],
      [270, 6]
    ],
    12 => [
      [0, 0],
      [30, 1],
      [45, 1.5],
      [90, 3],
      [180, 6],
      [270, 9]
    ]
  }

  test_cases.each_pair do |length, expectations|
    context "length #{length}" do
      expectations.each do |expectation|
        it "gets #{expectation[1]} for angle #{expectation[0]}" do
          expect(Neoclock.alg length, expectation[0]).to eq expectation[1]
        end
      end
    end
  end
end
