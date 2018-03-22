require 'day11'

puzzle_input = ""

RSpec.describe Day11 do
  context '' do
    let(:day) { Day11.new }
    it '' do
      expect(day.solve('ne,ne,ne')).to eq [3, 3]
    end
    
    it '' do
      expect(day.solve('ne,ne,sw,sw')).to eq [0, 2]
    end

    it '' do
      expect(day.solve('ne,ne,s,s')).to eq [2, 2]
    end
    it '' do
      expect(day.solve('se,sw,se,sw,sw')).to eq [3, 3]
    end

    it '' do
      input = File.new('lib/inputday11.txt')
      expect(day.solve(input.each_line.map(&:chop)[0])).to eq [643, 1471]
    end

    
  end
end
