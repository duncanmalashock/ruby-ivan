module Rotatable
  include Math
  def rotate_x(theta)
    self.points.each do |p|
      pp = [0,0,0]
      pp[0] = p[0]
      pp[1] = p[1] * cos(theta) - p[2] * sin(theta)
      pp[2] = p[1] * sin(theta) + p[2] * cos(theta)
      p[0] = pp[0]
      p[1] = pp[1]
      p[2] = pp[2]
    end
  end

  def rotate_y(theta)
    self.points.each do |p|
      pp = [0,0,0]
      pp[0] = p[2] * sin(theta) + p[0] * cos(theta)
      pp[1] = p[1]
      pp[2] = p[2] * cos(theta) - p[0] * sin(theta)
      p[0] = pp[0]
      p[1] = pp[1]
      p[2] = pp[2]
    end
  end

  def rotate_z(theta)
    self.points.each do |p|
      pp = [0,0,0]
      pp[0] = p[0] * cos(theta) - p[1] * sin(theta)
      pp[1] = p[0] * sin(theta) + p[1] * cos(theta)
      pp[2] = p[2]
      p[0] = pp[0]
      p[1] = pp[1]
      p[2] = pp[2]
    end
  end
end

module Translatable
  def translate(delta)
    self.points.each do |p|
      p[0] += delta[0]
      p[1] += delta[1]
      p[2] += delta[2]
    end
  end
end

module Scalable
  def scale(delta)
    self.points.each do |p|
      p[0] *= delta[0]
      p[1] *= delta[1]
      p[2] *= delta[2]
    end
  end
end