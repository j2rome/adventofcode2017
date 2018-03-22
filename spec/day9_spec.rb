require 'day9'


RSpec.describe Day9 do
  context '' do
    let(:day) { Day9.new }
    it '' do
      expect(day.solve('{}')).to eq [1,0]
    end
    it '' do
      expect(day.solve('{{{}}}')).to eq [6, 0]
    end
    it '' do
      expect(day.solve('{{},{}}')).to eq [5, 0]
    end
    it '' do
      expect(day.solve('{{{},{},{{}}}}')).to eq [16, 0]
    end
    it '' do
      expect(day.solve('{<a>,<a>,<a>,<a>}')).to eq [1, 4]
    end
    it '' do
      expect(day.solve('{{<ab>},{<ab>},{<ab>},{<ab>}}')).to eq [9, 8]
    end
    it '' do
      expect(day.solve('{{<!!>},{<!!>},{<!!>},{<!!>}}')).to eq [9, 0]
    end
    it '' do
      expect(day.solve('{{<a!>},{<a!>},{<a!>},{<ab>}}')).to eq [3, 17]
    end

    it '' do
      input = File.new('lib/inputday9.txt')
      expect(day.solve(input)).to eq [15_922, 7314]
    end

    it '' do
      expect(day.solve('<>')).to eq [0, 0]
    end
    it '' do
      expect(day.solve('<random characters>')).to eq [0, 17]
    end
    it '' do
      expect(day.solve('<<<<>')).to eq [0, 3]
    end
    it '' do
      expect(day.solve('<{!>}>')).to eq [0, 2]
    end

    it '' do
      expect(day.solve('<!!>')).to eq [0, 0]
    end
    it '' do
      expect(day.solve('<!!!>>')).to eq [0, 0]
    end

    it '' do
      expect(day.solve('<{o"i!a,<{i<a>')).to eq [0, 10]
    end
    
        
        
  end

  
  
end
