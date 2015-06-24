class LineStructError < Exception
end

class LineIndexRangeError < Exception
end

class Glyph
  include Spatial
  attr_accessor :points

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

  def instructions
    my_instructions = []
    @lines.each do |l|
      l.each do |p|
        my_instructions << @points[p]
      end
    end
    my_instructions
  end
end