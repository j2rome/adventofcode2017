require 'day10'

RSpec.describe Day10 do
  context '' do
    let(:day) { Day10.new }
    it '' do
      expect(day.solve(0..4, '3,4,1,5')).to eq 12
    end

    it '' do
      expect(day.solve(0..255, '187,254,0,81,169,219,1,190,19,102,255,56,46,32,2,216')).to eq 1980
    end

    it '' do
      expect(day.solve2(0..255, '187,254,0,81,169,219,1,190,19,102,255,56,46,32,2,216')).to eq '899124dac21012ebc32e2f4d11eaec55'
    end

    it '' do
      expect(day.solve2(0..255, '')).to eq 'a2582a3a0e66e6e86e3812dcb672a272'
    end

    it '' do
      expect(day.solve2(0..255, 'AoC 2017')).to eq '33efeb34ea91902bb2f59c9920caa6cd'
    end
    it '' do
      expect(day.solve2(0..255, '1,2,3')).to eq '3efbe78a8d82f29979031a4aa0b16a9d'
    end
    it '' do
      expect(day.solve2(0..255, '1,2,4')).to eq '63960835bcdc130f0b66d7ff4f6a5a8e'
    end
    
  end
end
