class Day11
  def initialize
    @start = Hexagon.new
    @furthest = 0
  end

  def solve(input)
    arrival = follow_path(input)
    [Hexagon.distance(@start, arrival), @furthest]
  end

  def follow_path(path)
    hex = Hexagon.new
    path.split(',').map do |direction|
      hex.send direction
      @furthest = [@furthest, Hexagon.distance(@start, hex)].max
    end
    hex
  end

  # Documentation from https://www.redblobgames.com/grids/hexagons/
  class Hexagon
    attr_reader :x, :y, :z

    def initialize
      @x = @y = @z = 0
    end

    def self.distance(a, b)
      manhattan_distance(a, b)
    end

    def ne
      @x += 1
      @z -= 1
    end

    def sw
      @x -= 1
      @z += 1
    end

    def nw
      @x -= 1
      @y += 1
    end

    def se
      @x += 1
      @y -= 1
    end

    def n
      @y += 1
      @z -= 1
    end

    def s
      @y -= 1
      @z += 1
    end

    def self.manhattan_distance(a, b)
      ((a.x - b.x).abs + (a.y - b.y).abs + (a.z - b.z).abs) / 2
    end
  end
end
