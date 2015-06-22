class TeensyVOutputDouble
  def initialize(port, baud, data_bits, stop_bits)
  end
  def write(value)
    return value
  end
end

class ThreeDPointFixture
  attr_accessor :x, :y, :z
  def initialize
    @x = 10
    @y = 20
    @z = 30
  end
end

class TwoDPointFixture
  attr_accessor :x, :y, :z
  def initialize
    @x = 10
    @y = 20
    @z = nil
  end
end

module CubeFixture
  def self.geometry
    {
      points: [ 
        [-1,-1,1],
        [1,-1,1], 
        [1,1,1],
        [-1,1,1],
        [-1,1,-1],
        [1,1,-1],
        [-1,-1,-1],
        [1,-1,-1]
      ],
      lines: [
        [0, 1],
        [1, 2],
        [2, 3],
        [3, 0],
        [3, 4],
        [2, 5],
        [1, 7],
        [4, 6],
        [4, 5],
        [0, 6],
        [6, 7],
        [7, 5]
      ]
    }
  end
end

module BufferFixture
  def self.instructions
    [
      TwoDPointFixture.new,
      TwoDPointFixture.new,
      TwoDPointFixture.new,
      TwoDPointFixture.new,
    ]
  end
end
