require_relative '../lib/ivan'
require 'yaml'

display = Ivan::Display.new(
  device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display: display)

cube_yaml = YAML.load_file('apps/models/cube.yml')
cube_1 = Ivan::Glyph.new(
  model: Ivan::Model.new_from_yaml(cube_yaml),
  scale: 1.0)

x = 0
while (true) do
  x += 0.01
  cube_1.scale = Math.sin(x)
  output.render_and_send cube_1
  sleep 0.01
end
