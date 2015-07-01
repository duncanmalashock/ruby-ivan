class Point
  include Math
  attr_reader :x, :y, :z

  def initialize (x, y, z)
    @x = x;
    @y = y;
    @z = z;
  end

  def screen_safe?(boundary)
    return ( @x > boundary[:x_min] and \
             @x < boundary[:x_max] and \
             @y > boundary[:y_min] and \
             @y < boundary[:y_max] and \
             @z == 0 )
  end

  def self.interpolate(point1, point2, weight)
    return Point.new(
        point1.x + (point2.x - point1.x) * weight,
        point1.y + (point2.y - point1.y) * weight,
        point1.z + (point2.z - point1.z) * weight,
      )
  end

  def self.transforms
    return [:translate,
            :scale,
            :rotate_x,
            :rotate_y,
            :rotate_z ]
  end

  def translate(delta)
    return Point.new( 
      @x + delta[0],
      @y + delta[1],
      @z + delta[2] )
  end

  def scale(delta)
    return Point.new( 
      @x * delta[0],
      @y * delta[1],
      @z * delta[2] )
  end

  def rotate_x(theta)
    return Point.new( 
      @x,
      @y * cos(theta) - @z * sin(theta),
      @y * sin(theta) + @z * cos(theta) )
  end

  def rotate_y(theta)
    return Point.new( 
      @z * sin(theta) + @x * cos(theta),
      @y,
      @z * cos(theta) - @x * sin(theta) )
  end

  def rotate_z(theta)
    return Point.new( 
      @x * cos(theta) - @y * sin(theta),
      @x * sin(theta) + @y * cos(theta),
      @z )
  end

  def project(x = 0, y = 0, z = Ivan.default_focal_length)
    pov = Point.new(x, y, z)
    return Point.new( 
      pov.z * (@x - pov.x) / (@z + pov.z) + pov.x,
      pov.z * (@y - pov.y) / (@z + pov.z) + pov.y,
      0 )
  end

end