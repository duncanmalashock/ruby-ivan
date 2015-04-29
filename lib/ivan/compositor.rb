# Compositor
# ----------
# Collects 2d views and outputs their drawing instructions to
# a renderer, clipping all drawing output to a bounding box.

class Compositor
  attr_reader :bounding_box
  attr_reader :renderer
  attr_accessor :views
  attr_reader :drawing_instructions
  def initialize(renderer_class, bounding_box)
    @renderer = renderer_class.new()
    @bounding_box = bounding_box
    @drawing_instructions = []
  end
  def add_view(view)
    @views << view
  end
  def composite
    @drawing_instructions = []
    @views.each do |v|
    end
  end
  def render
    @renderer.render(@drawing_instructions)
  end
end
