class Day5

  def initialize(part2 = false)
    @part2 = part2
  end
  
  def solve(input)
    array = input.each_line.map { |line| line.split }.flatten.map(&:to_i)

    index = 0
    steps = 0
    while index < array.size
      value = array[index]
      array[index] = next_value(value)
      index += value
      steps += 1
    end
    steps
  end

  def next_value(value)
    return value - 1 if @part2 && value >= 3
    value + 1
  end
  
end

