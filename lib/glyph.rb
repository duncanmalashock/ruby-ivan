module Ivan
  # A geometric object that can be rendered
  class Glyph
    attr_reader :model, :position, :rotation, :scale, :children

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
      @children = []
    end

    def add_child(child)
      @children.push(child)
    end

    def scale=(scale)
      if !scale.respond_to? :length
        @scale = [scale, scale, scale]
      else
        @scale = scale
      end
    end

    def render
      my_points = @model.points
      @children.each do |c|
        my_points << c.render
      end
      return do_transforms(my_points.flatten)
    end

    protected

    def do_transforms(points)
      points.map do |p|
        TransformsPoints.translate(
          point: TransformsPoints.scale(
            point: p,
            scale_amount: @scale),
          translate_amount: @position)
      end
    end
  end
end
