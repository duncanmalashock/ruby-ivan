# Glyph
# A geometric object that can be rendered

module Ivan
  class Glyph
    attr_reader :geometry, :rotation

    def initialize(geometry:, rotation:[0,0,0])
      @geometry = geometry
      @rotation = rotation
    end

    def render
      return @geometry
    end
  end
end