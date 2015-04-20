class Screen
  attr_reader :width
  attr_reader :height
  def initialize(renderer, width, height)
    @renderer = renderer
    @width = width
    @height = height
  end
  def render(instructions)
    @renderer.render(instructions)
  end
end