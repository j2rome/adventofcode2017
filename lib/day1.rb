class Day1
  def initialize(step)
    @step = step
  end

  def value_at(array, index)
    array[index % array.size]
  end

  def solve(captcha)
    c = captcha.chars.map(&:to_i)
    (0..c.size - 1)
      .map { |i| [value_at(c, i), value_at(c, i + @step)] }
      .select { |first, second| first == second }
      .sum(&:first)
  end
end
