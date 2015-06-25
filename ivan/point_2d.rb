class Point2D < Point
  def initialize (x, y)
    @x = x;
    @y = y;
  end

  def screen_safe?(boundary)
    @x > boundary[:x_min] and \
    @x < boundary[:x_max] and \
    @y > boundary[:y_min] and \
    @y < boundary[:y_max]
  end

  def translate_2D(delta)
    self.to_2D(
      [ @x + delta[0],
        @y + delta[1] ] )
  end

  def translate_3D(delta)
    self.to_3D(
      [ @x + delta[0],
        @y + delta[1],
        @z + delta[2] ] )
  end

  def scale(delta)
    self.to_2D(
      [ @x * delta[0],
        @y * delta[1] ] )
  end

  def rotate_x(theta)
    self.to_3D(
      [ @x,
        @y * cos(theta),
        @y * sin(theta) ] )
  end

  def rotate_y(theta)
    self.to_3D(
      [ @x * cos(theta),
        @y,
        @x * sin(theta) ] )
  end

  def rotate_z(theta)
    self.to_2D(
      [ @x * cos(theta) - @y * sin(theta),
        @x * sin(theta) + @y * cos(theta) ] )
  end

end