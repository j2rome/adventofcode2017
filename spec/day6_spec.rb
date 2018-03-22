require 'day6'

RSpec.describe Day6 do
  context '' do
    let(:day) { Day6.new }
    it '' do
      expect(day.solve('0	2	7	0')).to eq [5, 4]
    end

    it '' do
      expect(day.solve("0	5	10	0	11	14	13	4	11	8	8	7	1	4	12	11")).to eq [7864, 1695]
    end

  end
end
