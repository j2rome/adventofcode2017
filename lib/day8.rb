class Day8
  def solve(input)
    cpu = Cpu.new
    input.each_line.map do |instruction|
      
      ins = /^(?<register>[[:lower:]]*)\s(?<operation>inc|dec)\s(?<amount>-?\d*)\sif\s(?<register_cond>[[:lower:]]*)\s(?<comparison>==|>=|<=|>|<|!=)\s(?<amount_cond>-?\d*)/.match(instruction)
      
      cpu.inc_or_dec(ins[:register], ins[:operation], ins[:amount].to_i) if cpu.condition(ins[:register_cond], ins[:comparison], ins[:amount_cond].to_i)
    end
    [cpu.max, cpu.max_value]
  end

  class Cpu
    attr_reader :max_value

    def initialize
      @registers = Hash.new(0)
      @max_value = 0
    end

    def inc_or_dec(r, op, amount)
      @registers[r] += amount * (op == 'dec' ? -1 : 1)
      update_max_value(@registers[r])
    end

    def condition(r, comp, amount)
      @registers[r].send comp, amount
    end

    def update_max_value(new_value)
      @max_value = [max_value, new_value].max
    end

    def max
      @registers.values.max
    end
  end
end
