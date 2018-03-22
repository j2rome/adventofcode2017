require 'day4'


RSpec.describe Day4 do
  context '' do
    let(:day) { Day4.new }
    it '' do
      expect(day.solve('aa bb cc dd ee')).to eq 1
    end

    it '' do
      expect(day.solve('aa bb cc dd aa')).to eq 0
    end
    
    it '' do
      expect(day.solve('aa bb cc dd aaa')).to eq 1
    end

    it '' do
      input = File.new("lib/inputday4.txt")
      expect(day.solve(input)).to eq 455 
    end
    
  end

  context '' do
    let(:day) { Day4.new }
    it '' do
      expect(day.solve2('abcde fghij')).to eq 1
    end
    it '' do
      expect(day.solve2('abcde xyz ecdab')).to eq 0
    end
    it '' do
      expect(day.solve2('a ab abc abd abf abj')).to eq 1
    end
    it '' do
      expect(day.solve2('iiii oiii ooii oooi oooo')).to eq 1
    end
    
    it '' do
      expect(day.solve2('oiii ioii iioi iiio')).to eq 0
    end

      it '' do
      input = File.new("lib/inputday4.txt")
      expect(day.solve2(input)).to eq 186
    end
      
  end
  
  
end
