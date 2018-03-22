require 'day7'

RSpec.describe Day7 do
  context '' do
    let(:day) { Day7.new }
    it '' do
      expect(day.solve('pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)')).to eq 'tknk'
    end
    
     #    it '' do
#           expect(day.solve2('pbga (66)
# xhth (57)
# ebii (61)
# havc (66)
# ktlj (57)
# fwft (72) -> ktlj, cntj, xhth
# qoyq (66)
# padx (45) -> pbga, havc, qoyq
# tknk (41) -> ugml, padx, fwft
# jptl (61)
# ugml (68) -> gyxo, ebii, jptl
# gyxo (61)
# cntj (57)')).to eq 'tknk'
#     end
    
    it '' do
      input = File.new('lib/inputday7.txt')
      expect(day.solve(input)).to eq 'eugwuhl'
    end
    
    # it '' do
    #   input = File.new('lib/inputday7.txt')
    #   expect(day.solve2(input)).to eq 420
    # end
    
    
    
    
  end
end
