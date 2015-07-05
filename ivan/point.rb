class Point
  include Math
  attr_reader :x, :y, :z

  INSIDE = 0; # 0000
  LEFT = 1;   # 0001
  RIGHT = 2;  # 0010
  BOTTOM = 4; # 0100
  TOP = 8;    # 1000

  def initialize (x = 0, y = 0, z = 0)
    @x = x;
    @y = y;
    @z = z;
  end

  def screen_safe?(boundary)
    return ( @x >= boundary[:x_min] and \
             @x <= boundary[:x_max] and \
             @y >= boundary[:y_min] and \
             @y <= boundary[:y_max] and \
             @z == 0 )
  end

  def self.interpolate(point1, point2, weight)
    return Point.new(
        point1.x + (point2.x - point1.x) * weight,
        point1.y + (point2.y - point1.y) * weight,
        point1.z + (point2.z - point1.z) * weight,
      )
  end

  def outcode(boundary)
    outcode = 0

    if self.x < boundary[:x_min] then
      outcode |= LEFT
    end
    if self.x > boundary[:x_max] then
      outcode |= RIGHT
    end
    if self.y < boundary[:y_min] then
      outcode |= BOTTOM
    end
    if self.y > boundary[:y_max] then
      outcode |= TOP
    end

    return outcode
  end

  def self.clip_to_boundary(boundary, points)
    accepted = false

    while !accepted do
      x0 = points[0].x
      y0 = points[0].y
      x1 = points[1].x
      y1 = points[1].y
      outcode0 = points[0].outcode(boundary)
      outcode1 = points[1].outcode(boundary)
    
      if ( (outcode0 | outcode1) == 0 ) then
        return points
      elsif (outcode0 & outcode1 != 0) then
        return [nil, nil]
      else
        # puts "it's complicated"
        accepted = true
      end

      points[0] = Point.new(x0,y0)
      points[1] = Point.new(x1,y1)
    end
    
    return points
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