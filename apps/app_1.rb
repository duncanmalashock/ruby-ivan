require_relative '../lib/ivan'

display = Ivan::Display.new(
  device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display: display)

cube_1 = Ivan::Glyph.new(
  model: Ivan::Model.new_from_file("apps/models/cube.yml"))

output.render_and_send cube_1
