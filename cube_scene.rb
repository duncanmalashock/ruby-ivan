require_relative "lib/ivan"

a_renderer = Renderer.new

a_cube = Cube.new
a_view = View.new(a_cube)
a_renderer.render(a_view.lines)