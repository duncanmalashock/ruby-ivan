# Renderer
# ----------
# Receives drawing instructions and outputs them to hardware.

class StubRenderer
  def initialize
  end
  def render(instructions)
    "#{instructions.length} instructions rendered"
  end
end
