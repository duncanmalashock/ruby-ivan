class TeensyVOutputDouble
  def initialize(port, baud, data_bits, stop_bits)
  end
  def write(value)
    return value
  end
end

class ThreeDPointFixture
  attr_accessor :x, :y, :z
  def initialize(x = 10, y = 20, z = 30)
    @x = x
    @y = y
    @z = z
  end
end

class TwoDPointFixture
  attr_accessor :x, :y, :z
  def initialize(x = 10, y = 20)
    @x = x
    @y = y
    @z = 0
  end
end

module CubeFixture
  def geometry
    return Struct::Geometry.new(
      [ 
        [-1,-1,1],
        [1,-1,1], 
        [1,1,1],
        [-1,1,1],
        [-1,1,-1],
        [1,1,-1],
        [-1,-1,-1],
        [1,-1,-1]
      ],
      [
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
    )
  end
  module_function :geometry
end

module BufferFixture
  def self.to_buffer
    [
      Point.new(10, 20, 0),
      Point.new(10, 20, 0),
      Point.new(10, 20, 0),
      Point.new(10, 20, 0),
    ]
  end
end

module UnsafeBufferFixture
  def self.to_buffer
    [
      Point.new(-290, 0, 0),
      Point.new(-20, 500, 0)
    ]
  end
end
