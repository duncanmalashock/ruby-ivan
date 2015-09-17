require_relative '../lib/ivan'

display = Ivan::Display.new(
  device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display: display)

cube_1 = Ivan::Glyph.new(
  model: Ivan::Model.new_from_file('apps/models/cube.yml'),
  scale: 0.25)

x = 0
while (true) do
  x += 0.01
  cube_1.scale = Math.sin(x) * 0.4 + 0.5
  output.render_and_send cube_1
  sleep 0.01
end
