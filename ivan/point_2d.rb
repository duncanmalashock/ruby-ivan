class Point2D < Point
  def initialize (x, y)
    @x = x;
    @y = y;
  end

  def translate(delta)
    transform do |p|
      [ p.x + delta[0],
        p.y + delta[1],
        p.z + delta[2] ]
    end
  end

  def scale(delta)
    transform do |p|
      [ p.x * delta[0],
        p.y * delta[1],
        0.0 ]
    end
  end

  def rotate_x(theta)
    transform do |p|
      p.z = 0.0 if p.z.nil?
      [ p.x,
        p.y * cos(theta),
        p.y * sin(theta) ]
    end
  end

  def rotate_y(theta)
    transform do |p|
      [ p.x * cos(theta),
        p.y,
        p.x * sin(theta) ]
    end
  end

  def rotate_z(theta)
    transform do |p|
      [ p.x * cos(theta) - p.y * sin(theta),
        p.x * sin(theta) + p.y * cos(theta),
        p.z ]
    end
  end

end