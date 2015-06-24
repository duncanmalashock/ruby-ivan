class Point3D < Point
  attr_accessor :z

  def initialize (x, y, z)
    @x = x;
    @y = y;
    @z = z;
  end

  def translate(delta)
    transform_to_3D (
      [ @x + delta[0],
        @y + delta[1],
        @z + delta[2] ]
    )
  end

  def scale(delta)
    transform_to_3D (
      [ @x * delta[0],
        @y * delta[1],
        @z.nil? ? nil : @z * delta[2] ]
    )
  end

  def rotate_x(theta)
    transform_to_3D (
      [ @x,
        @y * cos(theta) - @z * sin(theta),
        @y * sin(theta) + @z * cos(theta) ]
    )
  end

  def rotate_y(theta)
    transform_to_3D (
      [ @z * sin(theta) + @x * cos(theta),
        @y,
        @z * cos(theta) - @x * sin(theta) ]
    )
  end

  def rotate_z(theta)
    transform_to_3D (
      [ @x * cos(theta) - @y * sin(theta),
        @x * sin(theta) + @y * cos(theta),
        @z ]
    )
  end

  def project(x = 0, y = 0, z = -125.0)
    pov = Point3D.new(x, y, z)
    transform_to_2D (
      [ pov.z * (@x - pov.x) / (@z + pov.z) + pov.x,
        pov.z * (@y - pov.y) / (@z + pov.z) + pov.y ]
    )
  end
end