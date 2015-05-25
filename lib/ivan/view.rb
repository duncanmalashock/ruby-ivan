class View
  attr_accessor :points
  attr_accessor :lines
  def initialize(actors, focal)
    eye = [0.0, 0.0, focal]
    self.points = []
    self.lines = []
    # puts "rendering a #{actor.points[0].length}-dimensional actor of class #{actor.class}"
    actors.each do |a|
      self.points += a.points.clone
      self.lines += a.lines.clone
    end
    self.points.each do |p|
      p[0] = (eye[2] * (p[0] - eye[0]) ) / (eye[2] + p[2]) + eye[0]
      p[1] = (eye[2] * (p[1] - eye[1]) ) / (eye[2] + p[2]) + eye[1]
    end
  end
end