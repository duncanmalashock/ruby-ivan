class Point
  include Math
  attr_accessor :x, :y

  def transform
    return Point3D.new(*yield(self))
  end
end