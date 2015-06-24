class Point
  include Math
  attr_accessor :x, :y


  def to_3D(coordinates)
    return Point3D.new(*coordinates)
  end

  def to_2D(coordinates)
    return Point2D.new(*coordinates)
  end
end