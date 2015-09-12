class Point
  # A single point in 3D space
  attr_reader :x, :y, :z
  def initialize(x: 0, y: 0, z: 0)
    @x = x
    @y = y
    @z = z
  end
end