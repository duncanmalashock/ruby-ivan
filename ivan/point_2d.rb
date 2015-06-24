class Point2D
  attr_accessor :x, :y
class Point2D < Point
  def initialize (x, y)
    @x = x;
    @y = y;
  end
end