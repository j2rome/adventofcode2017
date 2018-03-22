require 'day12'


RSpec.describe Day12 do
  context '' do
    let(:day) { Day12.new }
    it '' do
      expect(day.solve('0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5')).to eq 6
    end
     it '' do
    input = File.new('lib/inputday12.txt')
    expect(day.solve(input)).to eq 380
     end

     it '' do
       expect(day.solve2('0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5')).to eq 2
     end
     
     it '' do
       input = File.new('lib/inputday12.txt')
       expect(day.solve2(input)).to eq 181
     end
          
  end
  
 
end
