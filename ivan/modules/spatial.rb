module Spatial
  include Math

  def transform_points
    self.points = points.map do |p|
      p = Point.new(*yield(p))
    end
    return self
  end

  def translate(delta)
    transform_points do |p|
      [ p.x + delta[0],
        p.y + delta[1],
        ( p.z.nil? && delta[2].nil? ) ? nil : p.z + delta[2] ]
    end
  end

  def scale(delta)
    transform_points do |p|
      [ p.x * delta[0],
        p.y * delta[1],
        p.z.nil? ? nil : p.z * delta[2] ]
    end
  end

  def rotate_x(theta)
    transform_points do |p|
      p.z = 0.0 if p.z.nil?
      [ p.x,
        p.y * cos(theta) - p.z * sin(theta),
        p.y * sin(theta) + p.z * cos(theta) ]
    end
  end

  def rotate_y(theta)
    transform_points do |p|
      p.z = 0.0 if p.z.nil?
      [ p.z * sin(theta) + p.x * cos(theta),
        p.y,
        p.z * cos(theta) - p.x * sin(theta) ]
    end
  end

  def rotate_z(theta)
    transform_points do |p|
      [ p.x * cos(theta) - p.y * sin(theta),
        p.x * sin(theta) + p.y * cos(theta),
        p.z ]
    end
  end
end