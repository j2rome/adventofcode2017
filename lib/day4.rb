class Day4
  
  def solve(input)
    reject_pass(read(input)).size
  end

  
  def solve2(input)
    reject_pass(read(input).map {|line| line.map {|word| word.chars.sort.join}}).size
  end

  def read(input)
    input.each_line.map { |line| line.split }
  end
  
  def reject_pass(pass)
    pass.reject { |pass| pass.size != pass.uniq.size }
  end
end
