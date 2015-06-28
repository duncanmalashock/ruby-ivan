# Point is an abstract class, and is not meant to be instantiated.
# Instantiate Point2D and Point3D objects for applications.

class Point
  include Math
  attr_accessor :x, :y

  def screen_safe?(boundary)
    return false
  end

  def self.transforms
    return []
  end

  def to_3D(coordinates)
    return Point3D.new(*coordinates)
  end

  def to_2D(coordinates)
    return Point2D.new(*coordinates)
  end
end