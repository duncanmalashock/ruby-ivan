# Glyph
# A geometric object that can be rendered

module Ivan
  class Glyph
    attr_reader :geometry, :position, :rotation, :scale

    def initialize(geometry:, position:[0,0,0],
      rotation:[0,0,0], scale: 1.0)
      @geometry = geometry
      @position = position
      @rotation = rotation
      if (!scale.respond_to? :length)
        @scale = [scale, scale, scale]
      else
        @scale = scale
      end
    end

    def render
      return @geometry.render(
        position: @position,
        rotation: @rotation,
        scale: @scale)
    end
  end
end