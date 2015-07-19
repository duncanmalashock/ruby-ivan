class Glyph
  extend HasTransforms
  attr_reader :children

  has_transforms_for Point

  def self.new_from_model(model)
    return new(Ivan::Models[model])
  end

  def initialize(geometry)
    if geometry.valid?
      @points = geometry[:points].map do |p|
        Point.new(*p)
      end
      @lines = geometry[:lines]
      @children = []
    end
  end

  def << (child_glyph)
    @children << child_glyph
  end

  def project(x = 0, y = 0, z = Ivan.default_focal_length)
    @points = @points.map do |p|
      p.project(x, y, z)
    end
    @children = @children.map do |c|
      c.send(:project, x, y, z)
    end
    return self
  end

  def to_buffer
    my_instructions = []
    @lines.each do |l|
      l.each do |p|
        my_instructions << @points[p]
      end
    end
    self.children.each do |c|
      my_instructions << c.to_buffer
    end
    return my_instructions.flatten
  end
end