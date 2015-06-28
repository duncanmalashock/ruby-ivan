class Point2D < Point
  def initialize (x, y)
    @x = x;
    @y = y;
  end

  def screen_safe?(boundary)
    return ( @x > boundary[:x_min] and \
             @x < boundary[:x_max] and \
             @y > boundary[:y_min] and \
             @y < boundary[:y_max] )
  end

  def self.transforms
    return [:translate,
            :translate_2D,
            :scale,
            :scale_2D,
            :rotate_x,
            :rotate_y,
            :rotate_z,
            :rotate_z_2D]
  end

  def translate(delta)
    return self.to_3D(
      [ @x + delta[0],
        @y + delta[1],
        delta[2] ] )
  end

  def translate_2D(delta)
    return self.to_2D(
      [ @x + delta[0],
        @y + delta[1] ] )
  end

  def scale(delta)
    return self.to_3D ( 
      [ @x * delta[0],
        @y * delta[1],
        0 ] )
  end

  def scale_2D(delta)
    return self.to_2D(
      [ @x * delta[0],
        @y * delta[1] ] )
  end

  def rotate_x(theta)
    return self.to_3D(
      [ @x,
        @y * cos(theta),
        @y * sin(theta) ] )
  end

  def rotate_y(theta)
    return self.to_3D(
      [ @x * cos(theta),
        @y,
        @x * sin(theta) ] )
  end

  def rotate_z(theta)
    return self.to_3D ( 
      [ @x * cos(theta) - @y * sin(theta),
        @x * sin(theta) + @y * cos(theta),
        @z ] )
  end

  def rotate_z_2D(theta)
    return self.to_2D(
      [ @x * cos(theta) - @y * sin(theta),
        @x * sin(theta) + @y * cos(theta) ] )
  end
end