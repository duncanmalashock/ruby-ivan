class Compositor
  attr_reader :bounding_box
  attr_reader :renderer
  attr_reader :drawing_instructions
  def initialize(renderer_class, bounding_box)
    @renderer = renderer_class.new()
    @bounding_box = bounding_box
    @drawing_instructions = []
  end
  def add_instruction(instruction)
    @drawing_instructions << instruction
  end
  def clear_instructions
    @drawing_instructions = []
  end
  def render
    @renderer.render(@drawing_instructions)
  end
end
