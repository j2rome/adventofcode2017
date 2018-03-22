require 'day2'

RSpec.describe Day2 do
  context '' do
    let(:day) { Day2.new }
    it '' do
      expect(day.solve('5	1	9	5
7	 5	 3	
2	4	6	8')).to eq 18
    end

    it '' do
      input = File.new("lib/inputday2.txt")
      expect(day.solve(input)).to eq 32121
    end
  end

  context '' do
    let(:day) { Day2.new }
    it '' do
      expect(day.solve2('5	9	2	8
9	4	7	3
3	8	6	5')).to eq 9
    end

    it '' do
      input = File.new("lib/inputday2.txt")
      expect(day.solve2(input)).to eq 197
    end
  end
end
