class Day2
  def solve(input)
    input.each_line.map { |line| minmax(line.strip.split("\t")) }.collect { |x| x[1] - x[0] }.sum
  end

  def minmax(array)
    array.map(&:to_i).minmax
  end

  def solve2(input)
    input.each_line.map { |line| divisible_by_2(line.strip.split("\t")) }.sum
  end

  def divisible_by_2(array)
    array.map(&:to_i).combination(2).map { |a,b| (a/b if (a%b).zero?) || (b/a if (b%a).zero?) || 0 }.sum
  end
end
