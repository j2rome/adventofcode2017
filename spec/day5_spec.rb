require 'day5'

puzzle_input = ""

RSpec.describe Day5 do
  context '' do
    let(:day) { Day5.new }
    it '' do
      expect(day.solve('0 3 0 1 -3')).to eq 5
    end

    it '' do
      input = File.new("lib/inputday5.txt")
      expect(day.solve(input)).to eq 391540
    end
    
  end
  context '' do
    let(:day) { Day5.new(true) }
    it '' do
      expect(day.solve('0 3 0 1 -3')).to eq 10
    end
    it '' do
      input = File.new("lib/inputday5.txt")
      expect(day.solve(input)).to eq 30_513_679
    end
  end
end
