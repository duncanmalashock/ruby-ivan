module Ivan
  # Collection of Points which can be instantiated as a Glyph
  class Geometry
    attr_reader :points

    def initialize(points)
      @points = points
    end

    def render
      @points
    end
  end
end
