class Glyph
  extend HasTransforms

  attr_accessor :points
  has_transforms_for Point2D, Point3D

  def initialize(geometry)
    if geometry.valid? then
      @points = geometry[:points].map do |p|
        Point3D.new(*p)
      end
      @lines = geometry[:lines]
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