class LineStructError < Exception
end

class LineIndexRangeError < Exception
end

class Glyph
  extend HasTransforms

  attr_accessor :points
  has_transforms_for Point2D, Point3D

  def initialize(geometry)
    @points = geometry[:points].map do |p|
      Point3D.new(*p)
    end
    @lines = geometry[:lines]
    @lines.each do |l|
      raise LineStructError, "This line is not a 2-tuple" \
        if l.length != 2
      raise LineIndexRangeError, "Line vertex with invalid point index" \
        if not @points[l[0]] or not @points[l[1]]
    end
  end

  def self.new_from_model(model)
    return new(Ivan::Models[model])
  end

  def project(x = 0, y = 0, z = -125)
    @points = @points.map do |p|
      p.project(x, y, z)
    end
    return self
  end

  def instructions
    my_instructions = []
    @lines.each do |l|
      l.each do |p|
        my_instructions << @points[p]
      end
    end
    return my_instructions
  end
end