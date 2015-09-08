# Glyph
# A geometric object that can be rendered

module Ivan
  class Glyph
    attr_reader :geometry, :rotation, :scale

    def initialize(geometry:, rotation:[0,0,0], scale: 1.0)
      @geometry = geometry
      @rotation = rotation
      if (!scale.respond_to? :length)
        @scale = [scale, scale, scale]
      else
        @scale = scale
      end
    end

    def render
      return @geometry
    end
  end
end