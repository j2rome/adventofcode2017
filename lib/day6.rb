class Day6
  def solve(input)
    memory_banks = CycleArray.new(input.split.map(&:to_i))

    memory = []
    count = 0

    loop do
      count += 1
      distribution = memory_banks.distribute
      return [count, memory.size - memory.find_index(distribution)] if memory.include?(distribution)
      memory.push(distribution)
    end
  end

  class CycleArray
    def initialize(array)
      @array = array
      @index = 0
    end

    def start(index)
      @index = index
      
    end
      
    def next_item
      @index = succ
      @array[@index]
    end

    def distribute
      blocks = @array.max
      max_index = @array.find_index(blocks)
      @array[max_index] = 0
      start(max_index)
      while blocks != 0
        value = next_item
        @array[@index] = value + 1
        blocks -= 1
      end
      @array.dup
    end

    private

    def succ
      (@index + 1) % @array.size
    end
  end
end
