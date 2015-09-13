require_relative '../spec/mocks'
require_relative '../lib/ivan'

display = Ivan::Display.new(
  device_path: '/dev/tty.usbmodem54121',
  connection_type: ConnectionTypeMock)
output = Ivan::Output.new(display: display)

cube_1 = Ivan::Glyph.new(
  model: Ivan::Model.new([
    Ivan::Point.new(x: 2, y: 5, z: 0.3)
  ]),
  position: [2, 2, 2],
  scale: 2.0,
  rotation: [0, 10, 0])

output.clear
output.render cube_1
puts output.send_to_display
