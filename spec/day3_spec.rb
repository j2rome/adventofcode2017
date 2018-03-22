require 'day3'

RSpec.describe Day3 do
  context '' do
    let(:day) { Day3.new }
     it '' do
       expect(day.solve(1)).to eq 0
     end

    it '' do
      expect(day.solve(12)).to eq 3
    end

    it '' do
      expect(day.solve(23)).to eq 2
    end
    
    it '' do
      day = Day3.new(1024)
      expect(day.solve(1024)).to eq 31
    end

    # it '' do
    #   day = Day3.new(325489)
    #   expect(day.solve(325489)).to eq 552
    # end
  end
  context '' do
    # it '' do
    #   day = Day3.new(25, true)
      
    #   expect(day.solve2(325489)).to eq 0
    # end
    
    # it '' do
    #   day = Day3.new(75, true)
      
    #   expect(day.solve2(325489)).to eq 330785
    # end
    
    
  end
end
