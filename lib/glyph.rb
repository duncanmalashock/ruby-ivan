module Ivan
  # A geometric object that can be rendered
  class Glyph
    attr_reader :model, :position, :rotation, :scale

    def initialize(model:, position:[0, 0, 0],
      rotation:[0, 0, 0], scale: 1.0)
      @model = model
      @position = position
      @rotation = rotation
      if !scale.respond_to? :length
        @scale = [scale, scale, scale]
      else
        @scale = scale
      end
    end

    def render
      @model.points
    end
  end
end
