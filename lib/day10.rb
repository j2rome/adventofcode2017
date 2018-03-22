class Day10
  def solve(range, lengths)
    array = twist(range, lengths.split(',').map(&:to_i), 1)
    array.take(2).reduce(:*)
  end

  def twist(range, lengths, n)
    current = skip_size = 0
    list = CycleArray.new(range.to_a)
    list.start(current)
    
    n.times do
      lengths.each do |length|
        list.hash(length)
        list.next_item(length + skip_size)
        skip_size += 1
      end
    end
    list.array
  end
  
  def solve2(range, lengths)
    twist(range, lengths.bytes + [17, 31, 73, 47, 23], 64).each_slice(16).map { |byte|
      byte.reduce(0, :^).to_s(16).rjust(2, '0')
    }.join
  end

  class CycleArray
    attr_accessor :array

    def initialize(array)
      @array = array
      @index = 0
    end

    def start(index)
      @index = index
    end

    def next_item(x)
      @index = succ(@index + x)
      @array[@index]
    end

    def hash(length)
      target_index = @index + length - 1
      sub = (@index..target_index).to_a.map { |x| @array[succ(x)] }.reverse!
      (@index..target_index).to_a.each { |x| @array[succ(x)] = sub.shift }
    end

    private

    def succ(delta = 1)
      delta % @array.size
    end
  end
end
