require 'day8'

puzzle_input = ""

RSpec.describe Day8 do
  context '' do
    let(:day) { Day8.new }
    it '' do
      expect(day.solve('b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10')).to eq [1, 10]
    end
    
    it '' do
      input = File.new('lib/inputday8.txt')
      expect(day.solve(input)).to eq [5215, 6419]
    end
  end
end
