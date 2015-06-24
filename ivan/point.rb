class Point
  include Math
  attr_accessor :x, :y

  def transform_to_3D(coordinates)
    return Point3D.new(*coordinates)
  end

  def transform_to_2D(coordinates)
    return Point2D.new(*coordinates)
  end
end