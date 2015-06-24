class Point3D < Point
  attr_accessor :z

  def initialize (x, y, z)
    @x = x;
    @y = y;
    @z = z;
  end
end