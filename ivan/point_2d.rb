class Point2D < Point
  def initialize (x, y)
    @x = x;
    @y = y;
  end

  def translate(delta)
    transform_to_3D(
    [ @x + delta[0],
      @y + delta[1],
      @z + delta[2] ]
    )
  end

  def scale(delta)
    transform_to_2D(
    [ @x * delta[0],
      @y * delta[1] ]
    )
  end

  def rotate_x(theta)
    transform_to_3D(
    [ @x,
      @y * cos(theta),
      @y * sin(theta) ]
    )
  end

  def rotate_y(theta)
    transform_to_3D(
    [ @x * cos(theta),
      @y,
      @x * sin(theta) ]
    )
  end

  def rotate_z(theta)
    transform_to_2D(
    [ @x * cos(theta) - @y * sin(theta),
      @x * sin(theta) + @y * cos(theta) ]
    )
  end

end