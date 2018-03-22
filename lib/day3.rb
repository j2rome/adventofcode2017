# coding: utf-8

class Day3

  ORIGIN=1

  def initialize(max = 25, sum_adjacent_square = false)
    @matrix = Matrix.new(max, sum_adjacent_square)
    # [
    #   [17, 16, 15, 14, 13],
    #   [18,  5,  4,  3, 12],
    #   [19,  6,  1,  2, 11],
    #   [20,  7,  8,  9, 10],
    #   [21, 21, 23, 24, 25]
    # ]
  end
  
  def find_index(n)
    matrix = @matrix.data
    matrix.each_index { |i| matrix[i].each_index {|j| return [i, j] if matrix[i][j]== n } }
  end

  class Matrix

    attr_accessor :data
    
    def initialize(n, sum_adjacent_square)
      @count = 1
      @sum_adjacent_square = sum_adjacent_square
      @search = 325489
      @data = generate_matrix(n)
    end

    def generate_matrix(n)
      rows = Math.sqrt(n).round
      matrix = Array.new(rows) { Array.new(rows) }
      fill_matrix(matrix, center_position(rows), n+1)
    end

    private
    
    def center_position(rows)
      [rows / 2, rows / 2]
    end

    def sum_adjacent_neighbors(matrix, position)
      Directions.neighbors(position, matrix.size, matrix[0].size).map {|x| matrix[x[0]][x[1]] }.reject {|x| x.nil?}.sum
    end
    
    def value(matrix, position)
      result = @sum_adjacent_square ? sum_adjacent_neighbors(matrix, position) : @count
      puts result if result > @search
      @count = @count.succ
      result
    end
    
    def mark(matrix, current_position)
      matrix[current_position[0]][current_position[1]] = value(matrix,current_position)
    end

    def next_position(current_position, next_position)
    [current_position, next_position].transpose.map {|x| x.reduce(:+)}
    end

    def change_position(matrix, position, next_position)
      current_position = next_position(position, next_position)
      mark(matrix, current_position)
      current_position
    end

    def empty(matrix, position)
      matrix[position[0]][position[1]].nil?
    end
    
    def fill_matrix(matrix, start_position, max)
      matrix[start_position[0]][start_position[1]] = @count
      @count = @count.succ
      
      directions = Directions.new
      current_position = change_position(matrix, start_position, directions.start)

      while (@count != max)

        position = next_position(current_position, directions.see_next)
        if empty(matrix, position)
          current_position = change_position(matrix, current_position, directions.next)
        else
          current_position = change_position(matrix, current_position, directions.current)
        end
      end

      matrix
    end

  end

  
  def generate_matrix(n)
    m = Matrix.new(n)
  end

  
  def solve(input)
    origin_coordinates = find_index(ORIGIN)
    target_coordinates = find_index(input)

    manhattan_distance(origin_coordinates, target_coordinates)
  end


  def solve2(input)
    matrix = @matrix.data
   
  end

  def manhattan_distance(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs
  end
  
  class Directions
    DOWN = [-1, 0].freeze
    UP = [1, 0].freeze
    LEFT = [0, 1].freeze
    RIGHT = [0, -1].freeze

    UP_LEFT = [UP, LEFT].transpose.map { |x| x.reduce(:+) }
    UP_RIGHT = [UP, RIGHT].transpose.map { |x| x.reduce(:+) }
    DOWN_LEFT =  [DOWN, LEFT].transpose.map { |x| x.reduce(:+) }
    DOWN_RIGHT = [DOWN, RIGHT].transpose.map { |x| x.reduce(:+) }
    
    DIRECTIONS_ORDER = [LEFT, DOWN, RIGHT, UP].freeze
    
    def initialize
      @index = 0
    end

    def start
      @index = 0
      current
    end

    def current
      DIRECTIONS_ORDER[@index]
    end

    def next
      @index = succ
      DIRECTIONS_ORDER[@index]
    end

    def see_next
      DIRECTIONS_ORDER[succ]
    end

    def self.neighbors(position, x_max, y_max)
      [DOWN, UP, LEFT, RIGHT, UP_LEFT, UP_RIGHT, DOWN_LEFT, DOWN_RIGHT].collect {|d| [position, d].transpose.map { |x| x.reduce(:+) } }.reject { |x| (x[0] | x[1]) < 0 }.reject { |x| (x[0] >= x_max) | (x[1] >= y_max) }
    end
    
    private

    def succ
      (@index + 1) % DIRECTIONS_ORDER.size
    end
  end
   

end
