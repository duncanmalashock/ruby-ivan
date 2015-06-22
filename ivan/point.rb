class Point
  attr_accessor :x, :y, :z
  def initialize (x, y, z = nil)
    @x = x;
    @y = y;
    @z = z;
  end
end
